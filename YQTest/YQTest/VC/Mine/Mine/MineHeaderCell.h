//
//  MineHeaderCell.h
//  YQTest
//
//  Created by boli on 2019/1/2.
//  Copyright © 2019 boli. All rights reserved.
//

#import "YQBaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface MineHeaderCell : YQBaseTableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *leftImageView;

@property (strong, nonatomic) IBOutlet UIImageView *rightImageView;

@property (strong, nonatomic) IBOutlet UILabel *phoneLabel;

@property (strong, nonatomic) IBOutlet UILabel *companyLabel;

@end

NS_ASSUME_NONNULL_END
