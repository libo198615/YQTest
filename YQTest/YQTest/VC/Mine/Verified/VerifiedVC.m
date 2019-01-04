//
//  VerifiedVC.m
//  YQTest
//
//  Created by boli on 2018/12/27.
//  Copyright © 2018 boli. All rights reserved.
//

#import "VerifiedVC.h"
#import "VerifiedCell.h"
#import "VerifiedUploadCell.h"
#import "SHImagePicker.h"
#import "BindingBandkCardVC.h"

@interface VerifiedVC () <VerifiedUploadCellDelegate,SHImagePickerDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *sections;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSArray *sectionTitles;
@property (nonatomic, strong) NSArray *placeHolders;
@property (nonatomic, strong) NSMutableArray *texts;
@property (nonatomic, strong) NSMutableArray *images;
//@property (nonatomic, assign) NSInteger imageIdentifier;
@property (nonatomic, weak) UIImageView *uploadImageView;

@property (nonatomic, strong) SHImagePicker *imagePicker;

@end

@implementation VerifiedVC

+ (NSString *)storyboardName {
    return @"Mine";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"实名认证";
    
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    _images = [NSMutableArray arrayWithArray:@[@"", @"", @""]];
    _sections = @[@2, @3, @4, @2, @1];
    _sectionTitles = @[@"个人信息",
                       @"法人信息",
                       @"企业信息",
                       @"经办人信息",
                       @"上传企业证件信息"];
    _titles = @[@"姓名",
                @"身份证号",
                @"姓名",
                @"身份证号",
                @"手机号",
                @"企业全称",
                @"统一社会信用代码",
                @"企业邮箱",
                @"企业地址",
                @"姓名",
                @"手机号",
                ];
    _placeHolders = @[@"请输入您的真实姓名",
                      @"请输入您的身份证号",
                      @"请输入您的法人真实姓名",
                      @"请输入法人身份证号",
                      @"请输入法人手机号",
                      @"请输入企业全称",
                      @"请输入统一社会信用证书",
                      @"（选填）",
                      @"（选填）",
                      @"请输入真实姓名",
                      @"请输入您的手机号"];
    _texts = [NSMutableArray arrayWithArray: @[@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@""]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_sections[section] integerValue];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == _sections.count-1) {
        VerifiedUploadCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VerifiedUploadCell"];
        
        cell.delegate = self;
        return cell;
    } else {
        VerifiedCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VerifiedCell"];
        NSInteger index = indexPath.row;
        for (int i = 0; i < indexPath.section; i++) {
            if (i > 0) {
                index = index + [_sections[indexPath.section] integerValue];
            }
        }
        cell.label.text = _titles[index];
        cell.textField.placeholder = _placeHolders[index];
        cell.textField.text = _texts[index];
        cell.textField.tag = index;
        [cell.textField addTarget:self action:@selector(textFieldValueChanged:) forControlEvents:UIControlEventEditingChanged];
        
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == _sections.count-1) {
        return 300;
    }
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 50)];
    label.font = [UIFont systemFontOfSize:18];
    label.textColor = Color_333333;
    label.text = _sectionTitles[section];
    return label;
}

- (void)textFieldValueChanged:(UITextField *)textField {
    _texts[textField.tag] = textField.text;
}

#pragma mark - VerifiedUploadCellDelegate -
- (void)nextBtnSelected {
    BindingBandkCardVC *vc = [BindingBandkCardVC storyboardInstanceType];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)uploadImageToImageView:(UIImageView *)imageView {
//    _imageIdentifier = imageView.tag;
    _uploadImageView = imageView;
    [self showImagePicker];
}

#pragma mark - ImagePicker -
- (void)showImagePicker {
    if (!_imagePicker) {
        _imagePicker = [[SHImagePicker alloc] init];
        _imagePicker.maxSelectedImageCount = 1;
        _imagePicker.delegate = self;
    }
    [_imagePicker showImagePickerSheetInViewController:self];
}

- (void)didSelectedImage:(NSArray *)images {
    UIImage *image = images[0];
    _uploadImageView.image = image;
}



@end
