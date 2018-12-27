//
//  MyBillCell.m
//  YQTest
//
//  Created by boli on 2018/12/27.
//  Copyright © 2018 boli. All rights reserved.
//

#import "MyBillCell.h"
#import "MyBillView.h"

@interface MyBillCell ()

@property (nonatomic, strong) MyBillView *billView;

@end

@implementation MyBillCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
    _billView = [MyBillView xibInstancetype];
    [self.contentView addSubview:_billView];
    [_billView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(210);
    }];
    
    [_billView setTime:@"2019-10"
                number:@"137618900"
                amount:@"80万"
          interestRate:@"3%"
         transferPrice:@"70万"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
