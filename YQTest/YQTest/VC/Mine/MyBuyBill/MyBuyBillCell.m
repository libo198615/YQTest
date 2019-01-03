//
//  MyBuyBillCell.m
//  YQTest
//
//  Created by boli on 2019/1/3.
//  Copyright © 2019 boli. All rights reserved.
//

#import "MyBuyBillCell.h"
#import "BillView.h"

@interface MyBuyBillCell ()

@property (nonatomic, strong) BillView *billView;

@end

@implementation MyBuyBillCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _billView = [BillView xibInstancetype];
    [self.contentView addSubview:_billView];
    [_billView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.mas_equalTo(self.contentView);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
