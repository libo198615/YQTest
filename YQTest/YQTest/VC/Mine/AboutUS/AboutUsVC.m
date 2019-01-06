//
//  AboutUsVC.m
//  YQTest
//
//  Created by boli on 2019/1/6.
//  Copyright © 2019 boli. All rights reserved.
//

#import "AboutUsVC.h"
#import "ArrowCell.h"
#import "ContentCell.h"

@interface AboutUsVC ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation AboutUsVC

+ (NSString *)storyboardName {
    return @"Mine";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"关于我们";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        ArrowCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArrowCell"];
        cell.leftLabel.text = @"交易所介绍";
        return cell;
    } else if (indexPath.row == 1) {
        ArrowCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArrowCell"];
        cell.leftLabel.text = @"平台公告";
        return cell;
    } else {
        ContentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContentCell"];
        cell.leftLabel.text = @"联系我们";
        cell.rightLabel.text = @"2455555";
        return cell;
    }
}



@end
