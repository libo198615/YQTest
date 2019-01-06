//
//  PublishCell.m
//  YQTest
//
//  Created by boli on 2019/1/6.
//  Copyright © 2019 boli. All rights reserved.
//

#import "PublishCell.h"

@implementation PublishCell

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
