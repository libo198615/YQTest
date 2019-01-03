//
//  MyBuyBillVC.m
//  YQTest
//
//  Created by boli on 2019/1/2.
//  Copyright © 2019 boli. All rights reserved.
//

#import "MyBuyBillVC.h"
#import "MyBuyBillCell.h"

@interface MyBuyBillVC ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MyBuyBillVC

+ (NSString *)storyboardName {
    return @"Mine";
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyBuyBillCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyBuyBillCell"];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 250;
}

@end
