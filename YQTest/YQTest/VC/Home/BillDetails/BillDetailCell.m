//
//  BillDetailCell.m
//  YQTest
//
//  Created by boli on 2018/12/28.
//  Copyright © 2018 boli. All rights reserved.
//

#import "BillDetailCell.h"
#import "BillDetailsView.h"

@interface BillDetailCell ()
@property (nonatomic, strong) BillDetailsView *detailView;
@end

@implementation BillDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _detailView = [BillDetailsView xibInstancetype];
    [self.contentView addSubview:_detailView];
    [_detailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.mas_equalTo(self.contentView);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
