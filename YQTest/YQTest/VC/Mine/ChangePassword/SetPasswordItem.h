//
//  SetPasswordItem.h
//  YQTest
//
//  Created by boli on 2019/1/8.
//  Copyright © 2019 boli. All rights reserved.
//

#import "YQBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface SetPasswordItem : YQBaseView

@property (nonatomic, strong) UIView *centerView;

- (void)showIdentify;

- (void)hideIdentify;

@end

NS_ASSUME_NONNULL_END
