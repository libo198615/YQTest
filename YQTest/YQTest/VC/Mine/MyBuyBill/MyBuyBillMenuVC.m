//
//  MyBuyBillMenuVC.m
//  YQTest
//
//  Created by boli on 2019/1/3.
//  Copyright © 2019 boli. All rights reserved.
//

#import "MyBuyBillMenuVC.h"
#import "UIViewController+Help.h"
#import "MyBuyBillVC.h"

@interface MyBuyBillMenuVC ()

@end

@implementation MyBuyBillMenuVC

+ (NSString *)storyboardName {
    return @"Mine";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"买入的票";
    
    MyBuyBillVC *vc1 = [MyBuyBillVC storyboardInstanceType];
    vc1.billStatus = BillStatusAll;
    MyBuyBillVC *vc2 = [MyBuyBillVC storyboardInstanceType];
    vc2.billStatus = BillStatusWaitForTheOtherPartyToConfirm;
    MyBuyBillVC *vc3 = [MyBuyBillVC storyboardInstanceType];
    vc3.billStatus = BillStatusPrePayment;
    MyBuyBillVC *vc4 = [MyBuyBillVC storyboardInstanceType];
    vc4.billStatus = BillStatusDone;
    
    self.menuView.titleColor = Color_333333;
    self.menuView.titleSelectedColor = Color_548AE8;
    self.menuView.lineColor = Color_548AE8;
    self.menuView.backgroundColor = [UIColor whiteColor];
    
    [self setTitles:@[@"全部", @"待对方确认", @"代付款", @"已完成"] viewControllers:@[vc1, vc2, vc3, vc4]];
}


@end
