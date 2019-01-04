//
//  MySellMenuVC.m
//  YQTest
//
//  Created by boli on 2019/1/4.
//  Copyright © 2019 boli. All rights reserved.
//

#import "MySellMenuVC.h"
#import "MySellVC.h"

@interface MySellMenuVC ()

@end

@implementation MySellMenuVC

+ (NSString *)storyboardName {
    return @"Mine";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"买入的票";
    
    MySellVC *vc1 = [MySellVC storyboardInstanceType];
    vc1.billStatus = BillStatusAll;
    MySellVC *vc2 = [MySellVC storyboardInstanceType];
    vc2.billStatus = BillStatusWaitForTheOtherPartyToConfirm;
    MySellVC *vc3 = [MySellVC storyboardInstanceType];
    vc3.billStatus = BillStatusPrePayment;
    MySellVC *vc4 = [MySellVC storyboardInstanceType];
    vc4.billStatus = BillStatusDone;
    
    [self setTitles:@[@"全部", @"待对方确认", @"代付款", @"已完成"] viewControllers:@[vc1, vc2, vc3, vc4]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
