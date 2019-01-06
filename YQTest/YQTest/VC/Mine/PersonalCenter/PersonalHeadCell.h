//
//  PersonalHeadCell.h
//  YQTest
//
//  Created by boli on 2019/1/6.
//  Copyright © 2019 boli. All rights reserved.
//

#import "YQBaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface PersonalHeadCell : YQBaseTableViewCell

@property (strong, nonatomic) IBOutlet UILabel *leftLabel;

@property (strong, nonatomic) IBOutlet UIImageView *headImageView;

@property (strong, nonatomic) IBOutlet UIImageView *arrowImageView;

@end

NS_ASSUME_NONNULL_END
