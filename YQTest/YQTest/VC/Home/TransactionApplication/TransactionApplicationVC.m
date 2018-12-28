//
//  TransactionApplicationVC.m
//  YQTest
//
//  Created by boli on 2018/12/28.
//  Copyright © 2018 boli. All rights reserved.
//

#import "TransactionApplicationVC.h"

@interface TransactionApplicationVC ()

@property (strong, nonatomic) IBOutlet UILabel *companyLabel;

@property (strong, nonatomic) IBOutlet UILabel *leftLabel1;
@property (strong, nonatomic) IBOutlet UILabel *leftLabel2;
@property (strong, nonatomic) IBOutlet UILabel *leftLabel3;
@property (strong, nonatomic) IBOutlet UILabel *leftLabel4;
@property (strong, nonatomic) IBOutlet UILabel *leftLabel5;
@property (strong, nonatomic) IBOutlet UILabel *rightLabel1;
@property (strong, nonatomic) IBOutlet UILabel *rightLabel2;
@property (strong, nonatomic) IBOutlet UILabel *rightLabel3;
@property (strong, nonatomic) IBOutlet UILabel *rightLabel4;
@property (strong, nonatomic) IBOutlet UILabel *rightLabel5;

@property (strong, nonatomic) IBOutlet UIView *view1;
@property (strong, nonatomic) IBOutlet UIView *view2;

@property (strong, nonatomic) IBOutlet UILabel *readProtocolLabel;
@property (strong, nonatomic) IBOutlet UIButton *protocolBtn;
@property (strong, nonatomic) IBOutlet UIButton *nextBtn;


@end

@implementation TransactionApplicationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)layoutDefaultSubViews {
    _companyLabel.font = [UIFont systemFontOfSize:15];
    _companyLabel.textColor = Color_333333;
    
    NSArray *left = @[_leftLabel1, _leftLabel2, _leftLabel3, _leftLabel4, _leftLabel5];
    for (UILabel *label in left) {
        label.textColor = Color_595961;
    }
    
    _rightLabel1.textColor = [UIColor hex:@"#FF314A"];
    _rightLabel1.font = [UIFont boldSystemFontOfSize:18];
    NSArray *right = @[ _rightLabel2, _rightLabel3, _rightLabel4, _rightLabel5];
    for (UILabel *label in right) {
        label.textColor = Color_333333;
    }
    
    _readProtocolLabel.textColor = Color_8B9199;
}

- (IBAction)showProtocolAction:(UIButton *)sender {
}

- (IBAction)nextAction:(UIButton *)sender {
}

@end
