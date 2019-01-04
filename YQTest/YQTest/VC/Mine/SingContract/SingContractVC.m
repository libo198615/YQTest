//
//  SingContractVC.m
//  YQTest
//
//  Created by boli on 2018/12/27.
//  Copyright © 2018 boli. All rights reserved.
//

#import "SingContractVC.h"
#import "MyBillCell.h"
#import "SellerInfomationCell.h"
#import "SingContractCell.h"

@interface SingContractVC ()

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SingContractVC

+ (NSString *)storyboardName {
    return @"Mine";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - TableView -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            SingContractCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SingContractCell"];
            
            return cell;
        } else {
            MyBillCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyBillCell"];
            
            return cell;
        }
    } else if (indexPath.section == 1) {
        SellerInfomationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SellerInfomationCell"];
        return cell;
    }
    MyBillCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyBillCell"];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 90;
        } else {
            return 250;
        }
    } else if (indexPath.section == 1) {
        return 120;
    }
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    }
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return nil;
    }
    UIView *aview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 10)];
    aview.backgroundColor = [UIColor hex:@"F2F2F2"];
    return aview;
}
@end
