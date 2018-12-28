//
//  SHImagePicker.m
//  SHParent
//
//  Created by boli on 2018/9/12.
//  Copyright © 2018年 boli. All rights reserved.
//

#import "SHImagePicker.h"
#import <Photos/Photos.h>
#import <TZImagePickerController/TZImagePickerController.h>
#import "SHAlertController.h"
#import "Header.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "UIViewController+Help.h"
#import "UIImage+Help.h"

@implementation SHImagePicker

- (instancetype)init {
    if (self = [super init]) {
        _selectedImages = [NSMutableArray array];
    }
    return self;
}


- (void)showImagePickerSheetInViewController:(UIViewController *)vc {
    _superVC = vc;
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    _alphaView = [[UIView alloc] initWithFrame:keyWindow.bounds];
    _alphaView.alpha = 0;
    _alphaView.backgroundColor = [UIColor grayColor];
    [keyWindow addSubview:_alphaView];
    
    _bgView = [[UIView alloc] initWithFrame:keyWindow.bounds];
    _bgView.backgroundColor = [UIColor clearColor];
    [keyWindow addSubview:_bgView];
    
    NSInteger rowHeight = 70;
    NSInteger rowCount = 3;
    _sheetView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, rowHeight*rowCount)];
    _sheetView.backgroundColor = [UIColor whiteColor];
    [_bgView addSubview:_sheetView];
    
    NSArray *titles = @[@"拍照", @"从手机相册选择", @"取消"];
    for (int i = 0; i < rowCount; i ++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, i*rowHeight, SCREEN_WIDTH, rowHeight)];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        btn.tag = i;
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        [_sheetView addSubview:btn];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, (i+1)*rowHeight, SCREEN_WIDTH, 1)];
        line.backgroundColor = [UIColor blackColor];
        [_sheetView addSubview:line];
    }
    
    WeakSelf
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         weakSelf.alphaView.alpha = 0.3;
                         CGRect frame = weakSelf.sheetView.frame;
                         frame.origin.y -= rowHeight*rowCount;
                         weakSelf.sheetView.frame = frame;
                     } completion:^(BOOL finished) {
                         UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
                         [weakSelf.bgView addGestureRecognizer:tap];
                     }];
}

- (void)btnAction:(UIButton *)btn {
    if (btn.tag == 0) {
        [self takePhoto];
    } else if (btn.tag == 1) {
        [self selectPhoto];
    } else {
        
    }
    [self hide];
}

- (void)hide {
    WeakSelf
    _bgView.userInteractionEnabled = NO;
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         weakSelf.alphaView.alpha = 0;
                         CGRect frame = weakSelf.sheetView.frame;
                         frame.origin.y = SCREEN_HEIGHT;
                         weakSelf.sheetView.frame = frame;
                     } completion:^(BOOL finished) {
                         [weakSelf.alphaView removeFromSuperview];
                         weakSelf.alphaView = nil;
                         [weakSelf.bgView removeFromSuperview];
                         weakSelf.bgView = nil;
                     }];
    
}

- (void)selectPhoto {
    if (_selectedImages.count == _maxSelectedImageCount) {
        [HUD showHUDTitle:[NSString stringWithFormat:@"最多可添加%ld张图片",_maxSelectedImageCount] durationTime:HUD_Duration];
        return;
    }
    
    _tzImagePicker = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
//    _tzImagePicker.naviTitleColor = ktitle_common_Color;
//    _tzImagePicker.barItemTextColor = ktitle_common_Color;
    _tzImagePicker.alwaysEnableDoneBtn = YES;
    _tzImagePicker.allowPickingVideo = NO;
    _tzImagePicker.delegate = self;
    
    _tzImagePicker.maxImagesCount = _maxSelectedImageCount - _selectedImages.count;
    WeakSelf
    [_tzImagePicker setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        NSMutableArray *temp = [NSMutableArray array];
        NSMutableArray *selectedImgIdentifiers = [NSMutableArray array];
        [selectedImgIdentifiers removeAllObjects];
        for (int i = 0; i < photos.count; i++) {
            //                    PHAsset *asset = assets[i];
            //                    [selectedImgIdentifiers addObject:asset];
            //                    if (![self.selectedImgList containsObject:asset]) {
            [temp addObject:photos[i]];
            //                    }
        }
        
        [weakSelf.selectedImages addObjectsFromArray:temp];
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(didSelectedImage:)]) {
            [weakSelf.delegate didSelectedImage:weakSelf.selectedImages];
        }
    }];
    
    _tzImagePicker.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [_superVC presentViewController:_tzImagePicker animated:YES completion:nil];
}


/// 拍照按钮点击事件
- (void)takePhoto
{
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if ((authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied)) {
        NSDictionary *infoDict = [TZCommonTools tz_getInfoDictionary];
        // 无权限 做一个友好的提示
        NSString *appName = [infoDict valueForKey:@"CFBundleDisplayName"];
        if (!appName) appName = [infoDict valueForKey:@"CFBundleName"];
        
        NSString *message = [NSString stringWithFormat:[NSBundle tz_localizedStringForKey:@"请在设置里允许 %@ 使用相机 \"Settings -> Privacy -> Camera\""], appName];
        [SHAlertController alertTitle:@"不能使用相机" message:message determine:@"确定" determineHandler:nil];
    } else if (authStatus == AVAuthorizationStatusNotDetermined) {
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            if (granted) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self pushImagePickerController];
                });
            }
        }];
    } else {
        [self pushImagePickerController];
    }
}

// 调用相机
- (void)pushImagePickerController {
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable:sourceType]) {
        _imagePicker = [[UIImagePickerController alloc] init];
        _imagePicker.delegate = self;
        self.imagePicker.sourceType = sourceType;
        NSMutableArray *mediaTypes = [NSMutableArray array];
        [mediaTypes addObject:(NSString *)kUTTypeImage];
        self.imagePicker.mediaTypes = mediaTypes;
        [[UIViewController currentViewController] presentViewController:_imagePicker animated:YES completion:nil];
    } else {
        DebugLog(@"模拟器中无法打开照相机,请在真机中使用");
    }
}

#pragma mark - UIImagePickerController Delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    if ([[info objectForKey:UIImagePickerControllerMediaType] isEqualToString:(__bridge NSString *)kUTTypeImage]) {
        UIImage *img = [info objectForKey:UIImagePickerControllerOriginalImage];
        if (_delegate && [_delegate respondsToSelector:@selector(didSelectedImage:)]) {
            [_delegate didSelectedImage:@[img]];
        }
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}


@end
