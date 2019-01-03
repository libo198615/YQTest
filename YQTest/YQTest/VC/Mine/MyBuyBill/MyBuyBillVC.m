//
//  MyBuyBillVC.m
//  YQTest
//
//  Created by boli on 2019/1/2.
//  Copyright © 2019 boli. All rights reserved.
//

#import "MyBuyBillVC.h"

@interface MyBuyBillVC ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MyBuyBillVC

+ (instancetype)storyboardInstanceType {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Mine" bundle:nil];
    return [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([self class])];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    switch (_billStatus) {
        case BillStatusAll:
            self.tableView.backgroundColor = [UIColor redColor];
            break;
        case BillStatusWaitForTheOtherPartyToConfirm:
            self.tableView.backgroundColor = [UIColor blueColor];
            break;
        case BillStatusPrePayment:
            self.tableView.backgroundColor = [UIColor blackColor];
            break;
        case BillStatusDone:
            self.tableView.backgroundColor = [UIColor greenColor];
            break;
            
        default:
            break;
    }
    
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
