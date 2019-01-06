//
//  MineSelectCell.h
//  YQTest
//
//  Created by boli on 2019/1/2.
//  Copyright © 2019 boli. All rights reserved.
//

#import "YQBaseTableViewCell.h"
#import "UIView+Badge.h"

NS_ASSUME_NONNULL_BEGIN

@protocol MineSelectCellDelegate <NSObject>

- (void)leftBtnSelected;
- (void)rightBtnSelected;

@end

@interface MineSelectCell : YQBaseTableViewCell

@property (nonatomic, weak) id <MineSelectCellDelegate> delegate;

@property (strong, nonatomic) IBOutlet UIButton *leftBtn;
@property (strong, nonatomic) IBOutlet UIButton *rightBtn;

@property (strong, nonatomic) IBOutlet UIView *line;

@property (nonatomic, assign) NSInteger leftBadge;
@property (nonatomic, assign) NSInteger rightBadge;

@end

NS_ASSUME_NONNULL_END
