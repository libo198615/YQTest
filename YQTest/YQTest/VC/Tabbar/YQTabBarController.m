//
//  YQTabBarController.m
//  YQTest
//
//  Created by boli on 2018/12/26.
//  Copyright © 2018 boli. All rights reserved.
//

#import "YQTabBarController.h"
#import "UIColor+Help.h"

@interface YQTabBarController () <UITabBarControllerDelegate>

@end

@implementation YQTabBarController

+ (instancetype)storyboardInstanceType {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"YQTabBar" bundle:nil];
    return [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([self class])];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    UIView *aview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tabBar.frame.size.width, 2)];
//    aview.backgroundColor = [UIColor hex:@"#e4c177"];
//    [self.tabBar addSubview:aview];
    
//    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.tabBar.frame.size.width, self.tabBar.frame.size.height)];
//    bgImageView.image = [UIImage imageNamed:@"48"];
//    [self.tabBar insertSubview:bgImageView atIndex:0];
//    self.tabBar.clipsToBounds = YES;
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor hex:@"#8B9199"]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor hex:@"#648AE8"]} forState:UIControlStateSelected];
    
    NSArray *titles = @[@"首页", @"交易", @"发布", @"我的"];
    
    for (int i = 0; i < self.viewControllers.count; i++) {
        UIViewController *vc = self.viewControllers[i];
        
        vc.tabBarItem.image = [[UIImage imageNamed:[NSString stringWithFormat:@"tabbar_%d_unSelected",i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"tabbar_%d_selected",i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem.title = titles[i];
    }
    
    self.delegate = self;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
