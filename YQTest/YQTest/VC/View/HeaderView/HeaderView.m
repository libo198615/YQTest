//
//  HeaderView.m
//  YQTest
//
//  Created by boli on 2018/12/27.
//  Copyright © 2018 boli. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _leftTitleLabel.textColor = [UIColor hex:@"EC544F"];
    
    _rightTitleLabel.textColor = [UIColor hex:@"F5A623"];
    
    _leftSubTitleLabel.textColor = [UIColor hex:@"8B9199"];
    _leftSubTitleLabel.text = @"当月累计成交额";
    _rightSubTitleLabel.textColor = [UIColor hex:@"8B9199"];
    _rightSubTitleLabel.text = @"成交笔数";
    
    _line.backgroundColor = Color_F2F2F2;
}

- (void)setLeftTitle:(NSString *)left rightTitle:(NSString *)right {

    {
        NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@万",left]];
        [text yy_setFont:[UIFont systemFontOfSize:14] range:NSMakeRange(text.length-1, 1)];
        _leftTitleLabel.attributedText = text;
    }

    {
        NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@次",right]];
        [text yy_setFont:[UIFont systemFontOfSize:14] range:NSMakeRange(text.length-1, 1)];
        _rightTitleLabel.attributedText = text;
    }
}

@end
