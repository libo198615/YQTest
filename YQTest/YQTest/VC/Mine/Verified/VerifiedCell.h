//
//  VerifiedCell.h
//  YQTest
//
//  Created by boli on 2018/12/27.
//  Copyright © 2018 boli. All rights reserved.
//

#import "YQBaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface VerifiedCell : YQBaseTableViewCell

@property (strong, nonatomic) IBOutlet UILabel *label;

@property (strong, nonatomic) IBOutlet UITextField *textField;

@end

NS_ASSUME_NONNULL_END
