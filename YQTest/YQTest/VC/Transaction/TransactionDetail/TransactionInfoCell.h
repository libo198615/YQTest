//
//  TransactionInfoCell.h
//  YQTest
//
//  Created by boli on 2019/1/4.
//  Copyright © 2019 boli. All rights reserved.
//

#import "YQBaseTableViewCell.h"
#import "TradingInformationView.h"

NS_ASSUME_NONNULL_BEGIN

@interface TransactionInfoCell : YQBaseTableViewCell

@property (nonatomic, strong) TradingInformationView *infoView;

@end

NS_ASSUME_NONNULL_END
