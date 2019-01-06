//
//  PersonalCell.m
//  YQTest
//
//  Created by boli on 2019/1/6.
//  Copyright © 2019 boli. All rights reserved.
//

#import "ContentCell.h"

@implementation ContentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _leftLabel.textColor = Color_333333;
    _rightLabel.textColor = Color_8B9199;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
