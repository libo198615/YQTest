//
//  SHImagePicker.h
//  SHParent
//
//  Created by boli on 2018/9/12.
//  Copyright © 2018年 boli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <TZImagePickerController/TZImagePickerController.h>

@protocol SHImagePickerDelegate <NSObject>

- (void)didSelectedImage:(NSArray *)images;

@end

@interface SHImagePicker : NSObject <UIImagePickerControllerDelegate, TZImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, weak) id <SHImagePickerDelegate> delegate;

@property (nonatomic, strong) UIImagePickerController *imagePicker;

@property (nonatomic, strong) TZImagePickerController *tzImagePicker;

@property (nonatomic, strong) NSMutableArray *selectedImages;

@property (nonatomic, assign) NSInteger maxSelectedImageCount;


@property (nonatomic, strong) UIView *alphaView;
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIView *sheetView;


@property (nonatomic, weak) UIViewController *superVC;

- (void)showImagePickerSheetInViewController:(UIViewController *)vc;

@end
