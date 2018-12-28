//
//  PaymentAccountView.m
//  YQTest
//
//  Created by boli on 2018/12/28.
//  Copyright © 2018 boli. All rights reserved.
//

#import "PaymentAccountView.h"

@implementation PaymentAccountView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    NSArray *left = @[_leftLabel1, _leftLabel2];
    for (UILabel *label in left) {
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = Color_595961;
    }
    
    NSArray *right = @[_rightLabel1, _rightLabel2];
    for (UILabel *label in right) {
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = Color_333333;
    }
    
}

@end
