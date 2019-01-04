//
//  TransactionVC.m
//  YQTest
//
//  Created by boli on 2018/12/26.
//  Copyright © 2018 boli. All rights reserved.
//

#import "TransactionVC.h"
#import "HomeCell.h"
#import "BillDetailVC.h"

@interface TransactionVC ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TransactionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"交易";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeCell"];
    cell.model = self.items[indexPath.row];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    BillDetailVC *vc = [BillDetailVC storyboardInstanceType];
    [self.navigationController pushViewController:vc animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

@end
