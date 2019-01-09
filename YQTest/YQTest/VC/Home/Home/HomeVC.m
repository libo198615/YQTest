//
//  HomeVC.m
//  YQTest
//
//  Created by boli on 2018/12/26.
//  Copyright © 2018 boli. All rights reserved.
//

#import "HomeVC.h"
#import "HomeCell.h"
#import "HomeTitleCell.h"
#import "AccountModel.h"
#import "BillDetailVC.h"

@interface HomeVC ()

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AccountModel *model = [[AccountModel alloc] init];
    model.title = @"xxxxxx公司";
    model.interestRate = @"3.2";
    model.amount = @"500";
    model.expiryDate = @"2019-10-10";
    
    self.items = @[model, model];
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        HomeTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeTitleCell"];

        return cell;
    } else {
        HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeCell"];
        cell.model = self.items[indexPath.row];

        
        return cell;

    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        BillDetailVC *vc = [BillDetailVC storyboardInstanceType];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 220;
    }
    return 120;
}




@end
