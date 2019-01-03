//
//  MineItemCell.h
//  YQTest
//
//  Created by boli on 2019/1/2.
//  Copyright © 2019 boli. All rights reserved.
//

#import "YQBaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface MineItemCell : YQBaseTableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *leftImageView;
@property (strong, nonatomic) IBOutlet UIImageView *rightImageView;
@property (strong, nonatomic) IBOutlet UILabel *leftLabel;
@property (strong, nonatomic) IBOutlet UILabel *rightLabel;


@end

NS_ASSUME_NONNULL_END
