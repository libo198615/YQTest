//
//  LBMenuView.h
//  YQTest
//
//  Created by boli on 2019/1/2.
//  Copyright © 2019 boli. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LBMenuViewDelegate <NSObject>

- (void)selectTitleAtIndex:(NSInteger)index;

@end

@interface LBMenuView : UIView

@property (nonatomic, weak) id <LBMenuViewDelegate> delegate;



@property (nonatomic, strong) UIFont *titleFont;
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, strong) UIColor *titleSelectedColor;

@property (nonatomic, strong) UIColor *lineColor;

@property (nonatomic, assign) NSInteger currentIndex;


- (void)setTitles:(NSArray *)titles;

- (void)setSelectedTitleAtIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
