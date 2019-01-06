//
//  MineSelectCell.m
//  YQTest
//
//  Created by boli on 2019/1/2.
//  Copyright © 2019 boli. All rights reserved.
//

#import "MineSelectCell.h"

@implementation MineSelectCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (IBAction)leftBtnAction:(UIButton *)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(leftBtnSelected)]) {
        [_delegate leftBtnSelected];
    }
}

- (IBAction)rightBtnAction:(UIButton *)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(rightBtnSelected)]) {
        [_delegate rightBtnSelected];
    }
}

- (void)setLeftBadge:(NSInteger)leftBadge {
    _leftBadge = leftBadge;
    [_leftBtn LB_setBadgeNumber:leftBadge];
}

@end
