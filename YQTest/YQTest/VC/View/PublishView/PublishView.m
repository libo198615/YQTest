//
//  PublishView.m
//  YQTest
//
//  Created by boli on 2019/1/3.
//  Copyright © 2019 boli. All rights reserved.
//

#import "PublishView.h"

@implementation PublishView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _nameLabel.textColor = Color_333333;
    _leftTitleLabel.textColor = Color_333333;
    _middleTitleLabel.textColor = Color_333333;
    _leftTitleLabel.font = [UIFont boldSystemFontOfSize:18];
    _middleTitleLabel.font = [UIFont boldSystemFontOfSize:18];
    
    _leftSubTitleLabel.textColor = Color_8B9199;
    _middleSubTitleLabel.textColor = Color_8B9199;
    _rightSubTitleLabel.textColor = Color_8B9199;
    
    _timeLabel.textColor = Color_8B9199;
}

@end
