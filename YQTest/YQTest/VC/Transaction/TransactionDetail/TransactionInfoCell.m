//
//  TransactionInfoCell.m
//  YQTest
//
//  Created by boli on 2019/1/4.
//  Copyright © 2019 boli. All rights reserved.
//

#import "TransactionInfoCell.h"

@implementation TransactionInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _infoView = [TradingInformationView xibInstancetype];
    [self.contentView addSubview:_infoView];
    [_infoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.mas_equalTo(self.contentView);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
