//
//  TradingHeaderView.m
//  YQTest
//
//  Created by boli on 2018/12/28.
//  Copyright © 2018 boli. All rights reserved.
//

#import "TradingHeaderView.h"

@implementation TradingHeaderView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    NSArray *left = @[_leftLabel1, _leftLabel2, _leftLabel3, _leftLabel4];
    for (UILabel *label in left) {
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = Color_595961;
    }
    
    NSArray *right = @[_rightLabel1, _rightLabel3, _rightLabel4];
    for (UILabel *label in right) {
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = Color_333333;
    }
    
    _rightLabel2.font = [UIFont boldSystemFontOfSize:18];
    _rightLabel2.textColor = Color_FF314A;
}

@end
