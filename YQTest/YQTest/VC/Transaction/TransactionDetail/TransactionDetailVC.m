//
//  TransactionDetailVC.m
//  YQTest
//
//  Created by boli on 2019/1/4.
//  Copyright © 2019 boli. All rights reserved.
//

#import "TransactionDetailVC.h"
#import "TransactionPaymentAccountCell.h"
#import "TransactionInfoCell.h"
#import "TransactionHeaderCell.h"
#import "TransactionBaseInfoCell.h"

@interface TransactionDetailVC ()

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIButton *nextBtn;

@end

@implementation TransactionDetailVC

+ (NSString *)storyboardName {
    return @"Transaction";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"交易详情";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *arr = @[@2, @1, @1];
    return [arr[section] integerValue];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            TransactionHeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TransactionHeaderCell"];
            return cell;
        } else {
            TransactionBaseInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TransactionBaseInfoCell"];
            return cell;
        }
    } else if (indexPath.section == 1) {
        TransactionPaymentAccountCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TransactionPaymentAccountCell"];
        return cell;
    } else if (indexPath.section == 2) {
        TransactionInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TransactionInfoCell"];
        return cell;
    } else {
        UITableViewCell *cell = [[UITableViewCell alloc] init];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *arr = @[@[@80, @160], @[@120], @[@120]];
    return [arr[indexPath.section][indexPath.row] integerValue];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    } else {
        return 10;
    }
}

- (IBAction)nextBtnAction:(UIButton *)sender {
}

@end
