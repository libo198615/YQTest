//
//  SellerInfomationView.m
//  YQTest
//
//  Created by boli on 2018/12/27.
//  Copyright © 2018 boli. All rights reserved.
//

#import "SellerInfomationView.h"

@implementation SellerInfomationView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _label0.textColor = Color_333333;
    _label1.textColor = Color_8B9199;
    _label2.textColor = Color_8B9199;
    
    _label0.text = @"交易对手信息";
    _label1.text = @"公司名称";
    _label2.text = @"法人";
    
    _companyLabel.textColor = Color_333333;
    _legalPersonLabel.textColor = Color_333333;
}

- (void)setCompany:(NSString *)company legalPerson:(NSString *)legalPerson {
    _companyLabel.text = company;
    _legalPersonLabel.text = legalPerson;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
