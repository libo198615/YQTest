//
//  MyPublishCell.m
//  YQTest
//
//  Created by boli on 2019/1/3.
//  Copyright © 2019 boli. All rights reserved.
//

#import "MyPublishCell.h"
#import "PublishView.h"

@interface MyPublishCell ()
@property (nonatomic, strong) PublishView *publishView;
@end

@implementation MyPublishCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _publishView = [PublishView xibInstancetype];
    [self.contentView addSubview:_publishView];
    [_publishView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.mas_equalTo(self.contentView);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
