//
//  transactionPaymentAccountCell.m
//  YQTest
//
//  Created by boli on 2019/1/4.
//  Copyright © 2019 boli. All rights reserved.
//

#import "TransactionPaymentAccountCell.h"

@implementation TransactionPaymentAccountCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _accountView = [PaymentAccountView xibInstancetype];
    [self.contentView addSubview:_accountView];
    [_accountView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.right.mas_equalTo(self.contentView);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
