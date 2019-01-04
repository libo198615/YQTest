//
//  TransactionDetailHeaderCell.m
//  YQTest
//
//  Created by boli on 2019/1/4.
//  Copyright © 2019 boli. All rights reserved.
//

#import "TransactionHeaderCell.h"

@implementation TransactionHeaderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _statusView = [TradingStatusView xibInstancetype];
    [self.contentView addSubview:_statusView];
    [_statusView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.mas_equalTo(self.contentView);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
