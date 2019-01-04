//
//  TransactionDetailBaseInfoCell.m
//  YQTest
//
//  Created by boli on 2019/1/4.
//  Copyright © 2019 boli. All rights reserved.
//

#import "TransactionBaseInfoCell.h"
#import "TradingHeaderView.h"

@interface TransactionBaseInfoCell ()
@property (nonatomic, strong) TradingHeaderView *headerView;
@end

@implementation TransactionBaseInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _headerView = [TradingHeaderView xibInstancetype];
    [self.contentView addSubview:_headerView];
    [_headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.mas_equalTo(self.contentView);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
