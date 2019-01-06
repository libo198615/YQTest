//
//  FilterView.m
//  YQTest
//
//  Created by boli on 2019/1/5.
//  Copyright © 2019 boli. All rights reserved.
//

#import "FilterView.h"


@implementation FilterView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _emptyWidth = 100;
    
    _coverWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _coverWindow.backgroundColor = [UIColor clearColor];
//    _coverWindow.windowLevel = 100;
    _coverWindow.hidden = NO;
    [_coverWindow makeKeyWindow];
    
    _bgView = [[UIView alloc] initWithFrame:_coverWindow.bounds];
    _bgView.backgroundColor = [UIColor blackColor];
    _bgView.alpha = 0.0;
    [_coverWindow addSubview:_bgView];
    
    
    [_coverWindow addSubview:self];
    self.frame = CGRectMake( _coverWindow.frame.size.width, 0, _coverWindow.frame.size.width, _coverWindow.frame.size.height);
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenAnimation)];
    [_bgView addGestureRecognizer:tap1];
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenAnimation)];
    [self addGestureRecognizer:tap2];
}

- (void)show {

    [self showAnimation];
}

- (void)showAnimation {
    __weak __typeof__(self) weakSelf = self;
    [UIView animateWithDuration:0.5 animations:^{
        weakSelf.bgView.alpha = 0.3;
            self.frame = CGRectMake(weakSelf.emptyWidth, 0, weakSelf.coverWindow.frame.size.width, weakSelf.coverWindow.frame.size.height);
    }];
}

- (void)hiddenAnimation {
    __weak __typeof__(self) weakSelf = self;
    
    [UIView animateWithDuration:0.5 animations:^{
        weakSelf.bgView.alpha = 0.0;
        self.frame = CGRectMake(weakSelf.coverWindow.frame.size.width, 0, weakSelf.coverWindow.frame.size.width, weakSelf.coverWindow.frame.size.height);
    } completion:^(BOOL finished) {
        [[UIApplication sharedApplication].keyWindow makeKeyWindow];
        weakSelf.coverWindow = nil;
        [self removeFromSuperview];
    }];
}


@end
