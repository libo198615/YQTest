//
//  PersonalHeadCell.m
//  YQTest
//
//  Created by boli on 2019/1/6.
//  Copyright © 2019 boli. All rights reserved.
//

#import "PersonalHeadCell.h"

@implementation PersonalHeadCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _leftLabel.textColor = Color_333333;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
