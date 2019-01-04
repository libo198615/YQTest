//
//  transactionPaymentAccountCell.h
//  YQTest
//
//  Created by boli on 2019/1/4.
//  Copyright © 2019 boli. All rights reserved.
//

#import "YQBaseTableViewCell.h"
#import "PaymentAccountView.h"

NS_ASSUME_NONNULL_BEGIN

@interface TransactionPaymentAccountCell : YQBaseTableViewCell

@property (nonatomic, strong) PaymentAccountView *accountView;

@end

NS_ASSUME_NONNULL_END
