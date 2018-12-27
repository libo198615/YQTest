//
//  HUD.h
//  FamilyGuard
//
//  Created by boli on 2018/7/25.
//  Copyright © 2018年 Mars. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

@interface HUD : NSObject

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) MBProgressHUD *hud;

+ (instancetype)manager;

- (void)showHUDDelay;

- (void)show;

- (void)hideHUD;


+ (void)showHTTPMessage:(NSString *)message;


+ (MBProgressHUD *)showHUDTitle:(NSString *)title durationTime:(NSInteger)time;

+ (MBProgressHUD *)showHUDTitle:(NSString *)title durationTime:(NSInteger)time mode:(MBProgressHUDMode)mode;

+ (MBProgressHUD *)showHUD;

+ (void)hide;

+ (MBProgressHUD *)showHUDAddToView:(UIView *)view;

+ (MBProgressHUD *)showHUDTitle:(NSString *)title;

+ (MBProgressHUD *)showHUDTitle:(NSString *)title addToView:(UIView *)view;

+ (MBProgressHUD *)showHUDTitle:(NSString *)title mode:(MBProgressHUDMode)mode addToView:(UIView *)view;

+ (MBProgressHUD *)showCustomView:(UIView *)customView;

+ (MBProgressHUD *)showCustomView:(UIView *)customView addToView:(UIView *)view;

+ (void)hideInView:(UIView *)view;

@end
