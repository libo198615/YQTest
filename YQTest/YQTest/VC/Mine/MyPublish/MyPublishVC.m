//
//  MyPublishVC.m
//  YQTest
//
//  Created by boli on 2019/1/3.
//  Copyright © 2019 boli. All rights reserved.
//

#import "MyPublishVC.h"
#import "MyPublishCell.h"
#import "PublishDetailVC.h"

@interface MyPublishVC ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MyPublishVC

+ (NSString *)storyboardName {
    return @"Mine";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的发布";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyPublishCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyPublishCell"];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 140;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PublishDetailVC *vc = [PublishDetailVC storyboardInstanceType];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
