//
//  HomeTitleCell.m
//  YQTest
//
//  Created by boli on 2018/12/27.
//  Copyright © 2018 boli. All rights reserved.
//

#import "HomeTitleCell.h"
#import "HeaderView.h"

@interface HomeTitleCell ()

@property (nonatomic, strong) HeaderView *headerView;

@end

@implementation HomeTitleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _headerView = [HeaderView xibInstancetype];
    [self.contentView addSubview:_headerView];
    [_headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(210);
    }];
    
    [_headerView setLeftTitle:@"2000" rightTitle:@"1245"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
