//
//  FilterView.h
//  YQTest
//
//  Created by boli on 2019/1/5.
//  Copyright © 2019 boli. All rights reserved.
//

#import "YQBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface FilterView : YQBaseView

//@property (nonatomic, assign) BOOL isShowing;

@property (nonatomic, strong) UIWindow *coverWindow;
@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, assign) float emptyWidth;

- (void)show;

@end

NS_ASSUME_NONNULL_END
