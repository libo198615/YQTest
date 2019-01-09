//
//  HUD.m
//  FamilyGuard
//
//  Created by boli on 2018/7/25.
//  Copyright © 2018年 Mars. All rights reserved.
//

#import "HUD.h"

@implementation HUD

+ (void)showHTTPMessage:(NSString *)message {
    if (message && message.length > 0) {
        MBProgressHUD *hud = [HUD showHUDTitle:message];
        [hud hideAnimated:YES afterDelay:2];
    }
}

static HUD *manager = nil;

+ (instancetype)manager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[HUD alloc] init];
    });
    
    return manager;
}

- (void)showHUDDelay {
    [_timer invalidate];
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(show) userInfo:nil repeats:NO];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void)show {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    self.hud = [MBProgressHUD showHUDAddedTo:keyWindow animated:YES];
}

- (void)hideHUD {
    [_timer invalidate];
    [self.hud hideAnimated:YES];
}

+ (MBProgressHUD *)showHUDTitle:(NSString *)title durationTime:(NSInteger)time {
    return [HUD showHUDTitle:title durationTime:time mode:MBProgressHUDModeText];
}

+ (MBProgressHUD *)showHUDTitle:(NSString *)title durationTime:(NSInteger)time mode:(MBProgressHUDMode)mode {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:keyWindow animated:YES];
    if (!mode) {
        hud.mode = MBProgressHUDModeText;
    } else {
        hud.mode = mode;
    }
    
    hud.label.text = title;
    [hud hideAnimated:YES afterDelay:time];
    return hud;
}

+ (MBProgressHUD *)showHUD {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    return [HUD showHUDAddToView:keyWindow];
}

+ (void)hide {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [MBProgressHUD hideHUDForView:keyWindow animated:YES];
}

+ (MBProgressHUD *)showHUDAddToView:(UIView *)view {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    return hud;
}

+ (MBProgressHUD *)showHUDTitle:(NSString *)title {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    return [HUD showHUDTitle:title mode:MBProgressHUDModeText addToView:keyWindow];
}

+ (MBProgressHUD *)showHUDTitle:(NSString *)title addToView:(UIView *)view {
    return [HUD showHUDTitle:title mode:MBProgressHUDModeText addToView:view];
}

+ (MBProgressHUD *)showHUDTitle:(NSString *)title mode:(MBProgressHUDMode)mode addToView:(UIView *)view {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = mode;
    hud.label.text = title;
    return hud;
}

+ (void)hideInView:(UIView *)view {
    [MBProgressHUD hideHUDForView:view animated:NO];
}

+ (MBProgressHUD *)showCustomView:(UIView *)customView {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    return [HUD showCustomView:customView addToView:keyWindow];
}

+ (MBProgressHUD *)showCustomView:(UIView *)customView addToView:(UIView *)view {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.bezelView.color = [UIColor clearColor];
    hud.backgroundView.color = [UIColor grayColor];
    hud.backgroundView.alpha = 0.3;
    hud.customView = customView;
    
    for (UIView *view in hud.subviews) {
        for (UIView *aview in view.subviews) {
            if ([aview isKindOfClass:[UIVisualEffectView class]]) {
                aview.hidden = YES;
            }
        }
    }
    
    return hud;
}

@end
