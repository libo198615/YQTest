//
//  SetPasswordItem.m
//  YQTest
//
//  Created by boli on 2019/1/8.
//  Copyright © 2019 boli. All rights reserved.
//

#import "SetPasswordItem.h"

@implementation SetPasswordItem

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self layoutDefaultSubViews];
}

- (instancetype)init {
    if (self = [super init]) {
        [self layoutDefaultSubViews];
    }
    return self;
}

- (void)layoutDefaultSubViews {
    _centerView = [[UIView alloc] init];
    _centerView.backgroundColor = [UIColor blackColor];
    [self addSubview:_centerView];
    
    [_centerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(self);
        make.width.height.mas_equalTo(10);
    }];
    
    _centerView.layer.masksToBounds = YES;
    _centerView.layer.cornerRadius = _centerView.frame.size.width/2;
        _centerView.hidden = YES;
    
    self.layer.borderWidth = 1;
    self.layer.borderColor = [UIColor grayColor].CGColor;

}

- (void)showIdentify {
    _centerView.layer.masksToBounds = YES;
    _centerView.layer.cornerRadius = _centerView.frame.size.width/2;
    _centerView.hidden = NO;
}

- (void)hideIdentify {
    _centerView.hidden = YES;
}

@end
