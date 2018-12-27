//
//  SingContractCell.m
//  YQTest
//
//  Created by boli on 2018/12/27.
//  Copyright © 2018 boli. All rights reserved.
//

#import "SingContractCell.h"
#import "TradingStatusView.h"

@interface SingContractCell ()

@property (nonatomic, strong) TradingStatusView *tradingView;

@end

@implementation SingContractCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _tradingView = [TradingStatusView xibInstancetype];
    [self.contentView addSubview:_tradingView];
    [_tradingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.mas_equalTo(self.contentView);
    }];
    
    [_tradingView setTitle:@"待签署协议" icon:@""];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
