//
//  TradingStatusView.h
//  YQTest
//
//  Created by boli on 2018/12/27.
//  Copyright © 2018 boli. All rights reserved.
//

#import "YQBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface TradingStatusView : YQBaseView

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) IBOutlet UILabel *subTitleLabel;

- (void)setTitle:(NSString *)title icon:(NSString *)icon;

@end

NS_ASSUME_NONNULL_END
