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
#import "MyBuyBillMenuVC.h"
#import "MySellMenuVC.h"
#import "MyPublishVC.h"
#import "VerifiedVC.h"
#import "PersonalCenterVC.h"
#import "SettingVC.h"

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
        [cell setLeftBadge:5];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        PersonalCenterVC *vc = [PersonalCenterVC storyboardInstanceType];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            MyPublishVC *vc = [MyPublishVC storyboardInstanceType];
            [self.navigationController pushViewController:vc animated:YES];
        } else if (indexPath.row == 1) {
            VerifiedVC *vc = [VerifiedVC storyboardInstanceType];
            [self.navigationController pushViewController:vc animated:YES];
        } else if (indexPath.row == 4) {
            SettingVC *vc = [SettingVC storyboardInstanceType];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}

#pragma mark - MineSelectCellDelegate -

- (void)leftBtnSelected {
    MyBuyBillMenuVC *vc = [MyBuyBillMenuVC storyboardInstanceType];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)rightBtnSelected {
    MySellMenuVC *vc = [MySellMenuVC storyboardInstanceType];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
