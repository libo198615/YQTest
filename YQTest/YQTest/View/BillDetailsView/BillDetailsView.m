//
//  BillDetailsView.m
//  YQTest
//
//  Created by boli on 2018/12/28.
//  Copyright © 2018 boli. All rights reserved.
//

#import "BillDetailsView.h"

@implementation BillDetailsView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    NSArray *leftArr = @[_leftLabel0, _leftLabel1, _leftLabel2, _leftLabel3, _leftLabel4];
    NSArray *rightArr = @[_rightLabel0, _rightLabel1, _rightLabel2, _rightLabel3, _rightLabel4];
    
    for (int i = 0; i < leftArr.count; i++) {
        UILabel *left = leftArr[i];
        left.textColor = Color_8B9199;
        UILabel *right = rightArr[i];
        right.textColor = Color_333333;
    }
    
    for (int i = 0; i < leftArr.count - 1; i++) {
        UILabel *label = leftArr[i];
        UIView *line = [[UIView alloc] init];
        [self addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(label).mas_offset(5);
            make.right.mas_equalTo(label).mas_offset(-5);
            make.top.mas_equalTo(label.mas_bottom).mas_offset(8);
            make.height.mas_equalTo(1);
        }];
        line.backgroundColor = Color_F2F2F2;
    }
    
    
}

@end
