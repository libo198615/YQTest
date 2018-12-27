//
//  TradingStatusView.m
//  YQTest
//
//  Created by boli on 2018/12/27.
//  Copyright © 2018 boli. All rights reserved.
//

#import "TradingStatusView.h"

@implementation TradingStatusView

- (void)awakeFromNib {
    [super awakeFromNib];
    _subTitleLabel.hidden = YES;
}

- (void)setTitle:(NSString *)title icon:(NSString *)icon {
    _titleLabel.text = title;
    NSString *filePath = [[NSBundle mainBundle] pathForResource:icon ofType:@"png"];
    _imageView.image = [UIImage imageWithContentsOfFile:filePath];
}

@end
