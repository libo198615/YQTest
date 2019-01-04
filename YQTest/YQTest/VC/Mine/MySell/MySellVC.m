//
//  MySellVC.m
//  YQTest
//
//  Created by boli on 2019/1/4.
//  Copyright © 2019 boli. All rights reserved.
//

#import "MySellVC.h"
#import "MySellCell.h"
#import "SingContractVC.h"

@interface MySellVC ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MySellVC

+ (NSString *)storyboardName {
    return @"Mine";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    switch (_billStatus) {
        case BillStatusAll:
            self.tableView.backgroundColor = [UIColor redColor];
            break;
        case BillStatusWaitForTheOtherPartyToConfirm:
            self.tableView.backgroundColor = [UIColor blueColor];
            break;
        case BillStatusPrePayment:
            self.tableView.backgroundColor = [UIColor blackColor];
            break;
        case BillStatusDone:
            self.tableView.backgroundColor = [UIColor greenColor];
            break;
            
        default:
            break;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MySellCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MySellCell"];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SingContractVC *vc = [SingContractVC storyboardInstanceType];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
