//
//  MineVC.m
//  YQTest
//
//  Created by boli on 2018/12/26.
//  Copyright © 2018 boli. All rights reserved.
//

#import "MineVC.h"
#import "MineHeaderCell.h"
#import "MineItemCell.h"
#import "MineSelectCell.h"
#import "LBMenuVC.h"
#import "MyBuyBillVC.h"

@interface MineVC () <MineSelectCellDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *leftTitles;
@property (nonatomic, strong) NSArray *leftImageNames;
@property (nonatomic, strong) NSArray *rightTitles;

@end

@implementation MineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _leftTitles = @[@"我的发布", @"企业实名认证", @"常见问题", @"关于我们", @"设置"];
    _leftImageNames = @[@"", @"", @"", @"", @""];
    _rightTitles = @[@"", @"未认证", @"", @"", @""];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return 1;
    } else {
        return _leftTitles.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        MineHeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MineHeaderCell"];
        return cell;
    } else if (indexPath.section == 1) {
        MineSelectCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MineSelectCell"];
        cell.delegate = self;
        return cell;
    } else {
        MineItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MineItemCell"];
        cell.leftImageView.image = [UIImage imageNamed:_leftImageNames[indexPath.row]];
        cell.leftLabel.text = _leftTitles[indexPath.row];
        cell.rightLabel.text = _rightTitles[indexPath.row];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 80;
    } else if (indexPath.section == 1) {
        return 60;
    } else {
        return 50;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    } else if (section == 1) {
        return 10;
    } else {
        return 1;
    }
}

#pragma mark - MineSelectCellDelegate -

- (void)leftBtnSelected {
    MyBuyBillVC *vc1 = [MyBuyBillVC storyboardInstanceType];
    vc1.billStatus = BillStatusAll;
    MyBuyBillVC *vc2 = [MyBuyBillVC storyboardInstanceType];
    vc2.billStatus = BillStatusWaitForTheOtherPartyToConfirm;
    MyBuyBillVC *vc3 = [MyBuyBillVC storyboardInstanceType];
    vc3.billStatus = BillStatusPrePayment;
    MyBuyBillVC *vc4 = [MyBuyBillVC storyboardInstanceType];
    vc4.billStatus = BillStatusDone;
    
    LBMenuVC *vc = [[LBMenuVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    [vc setTitles:@[@"全部", @"待对方确认", @"代付款", @"已完成"] viewControllers:@[vc1, vc2, vc3, vc4]];
}

- (void)rightBtnSelected {
    
}

@end
