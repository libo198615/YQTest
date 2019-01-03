//
//  UIViewController+Help.h
//  APPHelp
//
//  Created by boli on 2018/8/7.
//  Copyright © 2018年 boli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBPushHelp.h"

@interface UIViewController (Help) <LBPushHelp>

+ (UIViewController *)currentViewController;

+ (instancetype)storyboardInstanceType;

// 使用protocol，反正category将原方法覆盖
+ (NSString *)storyboardName;



@end
