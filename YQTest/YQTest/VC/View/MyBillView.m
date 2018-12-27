//
//  MyBillView.m
//  YQTest
//
//  Created by boli on 2018/12/27.
//  Copyright © 2018 boli. All rights reserved.
//

#import "MyBillView.h"

@implementation MyBillView

- (void)awakeFromNib {
    [super awakeFromNib];
    _line0.backgroundColor = [UIColor hex:@"548AE8"];
    _line1.backgroundColor = [UIColor hex:@"F2F2F2"];
    _line2.backgroundColor = [UIColor hex:@"F2F2F2"];
    _line3.backgroundColor = [UIColor hex:@"F2F2F2"];
    
    _timeLabel.textColor = [UIColor hex:@"8B9199"];
}

- (void)setTime:(NSString *)time
         number:(NSString *)number
         amount:(NSString *)amount
   interestRate:(NSString *)interestRate
  transferPrice:(NSString *)transferPrice
{
    _timeLabel.text = [NSString stringWithFormat:@"申请时间:%@",time];
    _numberLabel.text = number;
    _amountLabel.text = amount;
    _interestRateLabel.text = interestRate;
    _transferPriceLabel.text = transferPrice;
    
}

@end
