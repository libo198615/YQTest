//
//  VerifyIdentidyVC.m
//  YQTest
//
//  Created by boli on 2019/1/8.
//  Copyright © 2019 boli. All rights reserved.
//

#import "VerifyIdentidyVC.h"
#import "SetPasswordVC.h"

@interface VerifyIdentidyVC ()
@property (strong, nonatomic) IBOutlet UIButton *nextBtn;

@end

@implementation VerifyIdentidyVC

+ (NSString *)storyboardName {
    return @"Mine";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)nextBtnAction:(UIButton *)sender {
    SetPasswordVC *vc = [SetPasswordVC storyboardInstanceType];
    [self.navigationController pushViewController:vc animated:YES];
}



@end
