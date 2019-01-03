//
//  YQBaseViewController.m
//  YQTest
//
//  Created by boli on 2018/12/26.
//  Copyright © 2018 boli. All rights reserved.
//

#import "YQBaseViewController.h"

@interface YQBaseViewController ()

@end

@implementation YQBaseViewController

//+ (instancetype)storyboardInstanceType {
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:[[self class] storyboardName] bundle:nil];
//    return [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([self class])];
//}
//
//+ (NSString *)storyboardName {
//    return @"未命名";
//}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)setCustomBackItem {
    [self.navigationController.navigationBar setBackIndicatorImage:[[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [self.navigationController.navigationBar setBackIndicatorTransitionMaskImage:[[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:@selector(popBack)];
    
    self.navigationItem.leftBarButtonItem = backItem;
}

- (void)popBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    DebugLog(@"dealloc %@",self);
}

@end
