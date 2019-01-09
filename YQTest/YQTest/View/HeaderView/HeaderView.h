//
//  HeaderView.h
//  YQTest
//
//  Created by boli on 2018/12/27.
//  Copyright © 2018 boli. All rights reserved.
//

#import "YQBaseView.h"
#import <SDCycleScrollView/SDCycleScrollView.h>

NS_ASSUME_NONNULL_BEGIN

@interface HeaderView : YQBaseView

@property (strong, nonatomic) IBOutlet SDCycleScrollView *topView;


@property (strong, nonatomic) IBOutlet UIView *contentView;

@property (strong, nonatomic) IBOutlet UILabel *leftTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *leftSubTitleLabel;

@property (strong, nonatomic) IBOutlet UILabel *rightTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *rightSubTitleLabel;

@property (strong, nonatomic) IBOutlet UIView *line;



- (void)setLeftTitle:(NSString *)left rightTitle:(NSString *)right;

- (void)setScrollImage:(NSArray *)images;

@end

NS_ASSUME_NONNULL_END
