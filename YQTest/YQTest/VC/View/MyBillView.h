//
//  MyBillView.h
//  YQTest
//
//  Created by boli on 2018/12/27.
//  Copyright © 2018 boli. All rights reserved.
//

#import "YQBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyBillView : YQBaseView

@property (strong, nonatomic) IBOutlet UILabel *timeLabel;


@property (strong, nonatomic) IBOutlet UILabel *numberLabel;
@property (strong, nonatomic) IBOutlet UILabel *amountLabel;
@property (strong, nonatomic) IBOutlet UILabel *interestRateLabel;
@property (strong, nonatomic) IBOutlet UILabel *transferPriceLabel;

@property (strong, nonatomic) IBOutlet UIView *line0;
@property (strong, nonatomic) IBOutlet UIView *line1;
@property (strong, nonatomic) IBOutlet UIView *line2;
@property (strong, nonatomic) IBOutlet UIView *line3;



- (void)setTime:(NSString *)time
         number:(NSString *)number
         amount:(NSString *)amount
   interestRate:(NSString *)interestRate
  transferPrice:(NSString *)transferPrice;

@end

NS_ASSUME_NONNULL_END
