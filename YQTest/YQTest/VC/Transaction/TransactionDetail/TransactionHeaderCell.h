//
//  TransactionDetailHeaderCell.h
//  YQTest
//
//  Created by boli on 2019/1/4.
//  Copyright © 2019 boli. All rights reserved.
//

#import "YQBaseTableViewCell.h"
#import "TradingStatusView.h"

NS_ASSUME_NONNULL_BEGIN

@interface TransactionHeaderCell : YQBaseTableViewCell

@property (nonatomic, strong) TradingStatusView *statusView;

@end

NS_ASSUME_NONNULL_END
