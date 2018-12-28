//
//  TradingHeaderView.h
//  YQTest
//
//  Created by boli on 2018/12/28.
//  Copyright © 2018 boli. All rights reserved.
//

#import "YQBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface TradingHeaderView : YQBaseView

@property (strong, nonatomic) IBOutlet UILabel *leftLabel1;
@property (strong, nonatomic) IBOutlet UILabel *leftLabel2;
@property (strong, nonatomic) IBOutlet UILabel *leftLabel3;
@property (strong, nonatomic) IBOutlet UILabel *leftLabel4;

@property (strong, nonatomic) IBOutlet UILabel *rightLabel1;
@property (strong, nonatomic) IBOutlet UILabel *rightLabel2;
@property (strong, nonatomic) IBOutlet UILabel *rightLabel3;
@property (strong, nonatomic) IBOutlet UILabel *rightLabel4;

@property (strong, nonatomic) IBOutlet UIView *line1;
@property (strong, nonatomic) IBOutlet UIView *line2;
@property (strong, nonatomic) IBOutlet UIView *line3;



@end

NS_ASSUME_NONNULL_END
