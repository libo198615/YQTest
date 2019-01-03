//
//  BillView.m
//  YQTest
//
//  Created by boli on 2019/1/3.
//  Copyright © 2019 boli. All rights reserved.
//

#import "BillView.h"

@implementation BillView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _leftLabel0.textColor = Color_333333;
    _leftLabel1.textColor = Color_333333;
    _leftLabel2.textColor = Color_333333;
    _leftLabel3.textColor = Color_333333;
    _leftLabel4.textColor = Color_333333;
    
    _rightLabel1.textColor = Color_FF314A;
    _rightLabel1.font = [UIFont boldSystemFontOfSize:18];
    _rightLabel2.textColor = Color_333333;
    _rightLabel3.textColor = Color_FF314A;
    _rightLabel3.font = [UIFont boldSystemFontOfSize:18];
    _rightLabel4.textColor = Color_333333;
}

- (void)setBillStatus:(BillStatus)billStatus {
    switch (billStatus) {
        case BillStatusDone:
            _rightLabel0.text = @"已成交";
            _rightLabel0.textColor = [UIColor hex:@"#548AE8"];
            _leftView.backgroundColor = [UIColor hex:@"#548AE8"];
            break;
        case BillStatusWaitForTheOtherPartyToConfirm:
            _rightLabel0.text = @"待对方确认";
            _rightLabel0.textColor = [UIColor hex:@"#F89E33"];
            _leftView.backgroundColor = [UIColor hex:@"#F89E33"];
            break;
        case BillStatusPrePayment:
            _rightLabel0.text = @"代付款";
            _rightLabel0.textColor = [UIColor hex:@"#F89E33"];
            _leftView.backgroundColor = [UIColor hex:@"#F89E33"];
            break;
        case BillStatusFailure:
            _rightLabel0.text = @"交易失败";
            _rightLabel0.textColor = Color_333333;
            _leftView.backgroundColor = Color_333333;
            break;
            
        default:
            break;
    }
    
    if (billStatus == BillStatusFailure) {
        _leftLabel0.textColor = Color_595961;
        _leftLabel1.textColor = Color_595961;
        _leftLabel2.textColor = Color_595961;
        _leftLabel3.textColor = Color_595961;
        _leftLabel4.textColor = Color_595961;
        
        _rightLabel1.textColor = Color_8B9199;
        _rightLabel1.font = [UIFont boldSystemFontOfSize:18];
        _rightLabel2.textColor = Color_333333;
        _rightLabel3.textColor = Color_8B9199;
        _rightLabel3.font = [UIFont boldSystemFontOfSize:18];
        _rightLabel4.textColor = Color_333333;
    } else {
        _leftLabel0.textColor = Color_333333;
        _leftLabel1.textColor = Color_333333;
        _leftLabel2.textColor = Color_333333;
        _leftLabel3.textColor = Color_333333;
        _leftLabel4.textColor = Color_333333;
        
        _rightLabel1.textColor = Color_FF314A;
        _rightLabel1.font = [UIFont boldSystemFontOfSize:18];
        _rightLabel2.textColor = Color_333333;
        _rightLabel3.textColor = Color_FF314A;
        _rightLabel3.font = [UIFont boldSystemFontOfSize:18];
        _rightLabel4.textColor = Color_333333;
    }
}

@end
