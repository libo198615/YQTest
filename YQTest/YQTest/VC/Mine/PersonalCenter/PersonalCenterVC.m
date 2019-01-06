//
//  PersonalCenter.m
//  YQTest
//
//  Created by boli on 2019/1/5.
//  Copyright © 2019 boli. All rights reserved.
//

#import "PersonalCenterVC.h"
#import "PersonalHeadCell.h"
#import "ContentCell.h"
#import "SHImagePicker.h"

@interface PersonalCenterVC () <SHImagePickerDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) SHImagePicker *imagePicker;
@end

@implementation PersonalCenterVC

+ (NSString *)storyboardName {
    return @"Mine";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人中心";
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        PersonalHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonalHeadCell"];
        cell.leftLabel.text = @"头像";
        return cell;
    } else {
        ContentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContentCell"];
        if (indexPath.row == 1) {
            cell.leftLabel.text = @"用户名";
            cell.rightLabel.text = @"135008777";
        } else {
            cell.leftLabel.text = @"手机号";
            cell.rightLabel.text = @"135008777";
        }
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 100;
    } else {
        return 50;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        if (!_imagePicker) {
            _imagePicker = [[SHImagePicker alloc] init];
            _imagePicker.maxSelectedImageCount = 1;
            _imagePicker.delegate = self;
        }
        [_imagePicker showImagePickerSheetInViewController:self];
    }
}

#pragma mark - SHImagePickerDelegate -
- (void)didSelectedImage:(NSArray *)images {
    
}

@end
