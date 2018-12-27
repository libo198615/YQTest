//
//  HomeCell.h
//  YQTest
//
//  Created by boli on 2018/12/26.
//  Copyright © 2018 boli. All rights reserved.
//

#import "YQBaseTableViewCell.h"
#import "AccountModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeCell : YQBaseTableViewCell

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIView *segmentationView0;
@property (nonatomic, strong) UIView *segmentationView1;
@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UILabel *interrestRateLabel;
@property (nonatomic, strong) UILabel *interrestRateNumberLabel;
@property (nonatomic, strong) UILabel *amountLabel;
@property (nonatomic, strong) UILabel *amountNumberLabel;
@property (nonatomic, strong) UILabel *expiryDateLabel;
@property (nonatomic, strong) UILabel *expiryDateNumberLabel;

@property (nonatomic, strong) AccountModel *model;

@end

NS_ASSUME_NONNULL_END

