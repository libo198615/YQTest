//
//  MenuVC.h
//  YQTest
//
//  Created by boli on 2019/1/2.
//  Copyright © 2019 boli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBMenuView.h"

NS_ASSUME_NONNULL_BEGIN

@interface LBMenuVC : UIViewController


@property (nonatomic, strong) LBMenuView *menuView;

@property (nonatomic, assign) float menuHeight;
//
//@property (nonatomic, strong) UIFont *titleFont;
//@property (nonatomic, strong) UIColor *titleColor;
//@property (nonatomic, strong) UIColor *titleSelectedColor;
//@property (nonatomic, strong) UIColor *menuColor;

- (void)setTitles:(NSArray *)titles viewControllers:(NSArray *)viewControllers;

@end

NS_ASSUME_NONNULL_END
