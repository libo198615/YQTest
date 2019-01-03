//
//  PublishView.h
//  YQTest
//
//  Created by boli on 2019/1/3.
//  Copyright © 2019 boli. All rights reserved.
//

#import "YQBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface PublishView : YQBaseView

@property (strong, nonatomic) IBOutlet UIView *bgView;
@property (strong, nonatomic) IBOutlet UIView *topView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;
@property (strong, nonatomic) IBOutlet UIView *line0;
@property (strong, nonatomic) IBOutlet UIView *line1;
@property (strong, nonatomic) IBOutlet UIView *line2;

@property (strong, nonatomic) IBOutlet UILabel *leftTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *leftSubTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *middleTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *middleSubTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *rightTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *rightSubTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;


@end

NS_ASSUME_NONNULL_END
