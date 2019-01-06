//
//  SettingVC.m
//  YQTest
//
//  Created by boli on 2019/1/6.
//  Copyright © 2019 boli. All rights reserved.
//

#import "SettingVC.h"
#import "ArrowCell.h"
#import "ContentCell.h"

@interface SettingVC ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SettingVC

+ (NSString *)storyboardName {
    return @"Mine";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        ArrowCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArrowCell"];
        cell.leftLabel.text = @"修改登录密码";
        return cell;
    } else if (indexPath.row == 1) {
        ArrowCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArrowCell"];
        cell.leftLabel.text = @"修改支付密码";
        return cell;
    } else {
        ContentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContentCell"];
        cell.leftLabel.text = @"版本号";
        cell.rightLabel.text = @"V 1.0";
        return cell;
    }
}

@end
