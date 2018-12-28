//
//  BillDetailVC.m
//  YQTest
//
//  Created by boli on 2018/12/28.
//  Copyright © 2018 boli. All rights reserved.
//

#import "BillDetailVC.h"
#import "BillDetailCell.h"
#import "BillPhotoCell.h"

@interface BillDetailVC ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation BillDetailVC

+ (instancetype)storyboardInstanceType {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Home" bundle:nil];
    return [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([self class])];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"票据详情";
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        BillDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BillDetailCell"];
        return cell;
    } else {
        BillPhotoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BillPhotoCell"];

        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 400;
    }
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return 40;
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 40)];
    label.backgroundColor = [UIColor groupTableViewBackgroundColor];
    label.text = @"    票据照片";
    label.font = [UIFont boldSystemFontOfSize:18];
    return label;
}


@end
