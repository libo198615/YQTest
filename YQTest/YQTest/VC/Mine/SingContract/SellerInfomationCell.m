//
//  SellerInfomationCell.m
//  YQTest
//
//  Created by boli on 2018/12/27.
//  Copyright © 2018 boli. All rights reserved.
//

#import "SellerInfomationCell.h"
#import "SellerInfomationView.h"

@interface SellerInfomationCell ()

@property (nonatomic, strong) SellerInfomationView *sellerInfoView;

@end

@implementation SellerInfomationCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _sellerInfoView = [SellerInfomationView xibInstancetype];
    [self.contentView addSubview:_sellerInfoView];
    [_sellerInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.mas_equalTo(self.contentView);
    }];
    
    [_sellerInfoView setCompany:@"xxxxx公司" legalPerson:@"xxx姓名"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
