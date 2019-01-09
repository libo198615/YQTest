//
//  UINavigationController+help.m
//  YUU
//
//  Created by boli on 2018/8/20.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "UINavigationController+help.h"
#import "JRSwizzle.h"

@implementation UINavigationController (help)

+ (void)load {
    [[UINavigationController class] jr_swizzleMethod:@selector(pushViewController:animated:) withMethod:@selector(LB_pushViewController:animated:) error:nil];
    
}

- (void)LB_pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    viewController.hidesBottomBarWhenPushed = YES;

    [self LB_pushViewController:viewController animated:animated];
    
    
//    UIViewController *vc = self.viewControllers.lastObject;
//    [self.navigationBar setBackIndicatorImage:[[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    [self.navigationBar setBackIndicatorTransitionMaskImage:[[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:@selector(popBack)];
    
    viewController.navigationItem.leftBarButtonItem = backItem;
    
    
}



- (void)popBack {
    [self popViewControllerAnimated:YES];
}



// 重写这两个方法，可以使 viewController 调用 - (UIStatusBarStyle)preferredStatusBarStyle
- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.visibleViewController;
}

- (UIViewController *)childViewControllerForStatusBarHidden {
    return self.visibleViewController;
}

@end
