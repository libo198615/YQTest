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
#import "FilterView.h"

@interface TransactionVC ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) FilterView *filter;
@end

@implementation TransactionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"交易";
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"筛选" style:UIBarButtonItemStylePlain target:self action:@selector(filterAction)];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)filterAction {
    _filter = [FilterView xibInstancetype];
    [_filter show];
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
