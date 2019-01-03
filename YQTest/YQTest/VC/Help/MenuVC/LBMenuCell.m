//
//  LBMenuCell.m
//  YQTest
//
//  Created by boli on 2019/1/2.
//  Copyright © 2019 boli. All rights reserved.
//

#import "LBMenuCell.h"

@implementation LBMenuCell

- (instancetype)init {
    if (self = [super init]) {
        _bgView = [[UIView alloc] initWithFrame:self.contentView.bounds];
        [self.contentView addSubview:_bgView];
    }
    return self;
}

@end
