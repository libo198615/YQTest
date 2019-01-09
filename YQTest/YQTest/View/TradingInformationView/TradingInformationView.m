//
//  TradingInformationView.m
//  YQTest
//
//  Created by boli on 2018/12/28.
//  Copyright © 2018 boli. All rights reserved.
//

#import "TradingInformationView.h"

@implementation TradingInformationView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    NSArray *left = @[_leftLabel1, _leftLabel2, _leftLabel3];
    for (UILabel *label in left) {
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = Color_595961;
    }
    
    NSArray *right = @[_rightLabel1, _rightLabel2, _rightLabel3];
    for (UILabel *label in right) {
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = Color_333333;
    }
    
}

@end
