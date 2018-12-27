//
//  ForgetPasswordVC.m
//  YQTest
//
//  Created by boli on 2018/12/27.
//  Copyright © 2018 boli. All rights reserved.
//

#import "ForgetPasswordVC.h"
#import <JKCountDownButton.h>
#import "PooCodeView.h"
#import "Header.h"

@interface ForgetPasswordVC ()
@property (strong, nonatomic) IBOutlet UITextField *phoneTextField;
@property (strong, nonatomic) IBOutlet UITextField *verificationCodeTextField;
@property (strong, nonatomic) IBOutlet UITextField *smsCodeTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UITextField *confirmPasswordTextField;
@property (strong, nonatomic) IBOutlet UILabel *loginLabel;
@property (strong, nonatomic) IBOutlet JKCountDownButton *verificationBtn;
@property (strong, nonatomic) IBOutlet PooCodeView *smsView;

@end

@implementation ForgetPasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self layoutDefaultSubViews];
    
    WeakSelf
    [weakSelf.verificationBtn countDownButtonHandler:^(JKCountDownButton *countDownButton, NSInteger tag) {
        if (weakSelf.phoneTextField.text.length != 11 || ![weakSelf.phoneTextField.text isNumber]) {
            [HUD showHUDTitle:@"请输入正确的手机号" durationTime:HUD_Duration];
            return ;
        }
        
        [weakSelf fetchVerificationCode];
        [countDownButton countDownFinished:^NSString *(JKCountDownButton *countDownButton, NSUInteger second) {
            countDownButton.enabled = YES;
            //            [weakSelf.verificationBtn setBackgroundColor:COLOR_Yellow];
            return @"重新获取";
        }];
    }];
}

- (void)fetchVerificationCode {
    
}


- (IBAction)submitAction:(UIButton *)sender {
}

- (void)layoutDefaultSubViews {
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"已有账号？请直接登录"];
    [text yy_setColor:[UIColor hex:@"666666"] range:NSMakeRange(text.length-2, 2)];
    [text yy_setColor:[UIColor hex:@"999999"] range:NSMakeRange(0, text.length-2)];
    _loginLabel.attributedText = text;
    _loginLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *loginTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showLogin)];
    [_loginLabel addGestureRecognizer:loginTap];
    
    _smsView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeCode)];
    [_smsView addGestureRecognizer:tap];
}

- (void)showLogin {
    
}

- (void)changeCode {
    [_smsView changeCode];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_phoneTextField resignFirstResponder];
    [_passwordTextField resignFirstResponder];
    [_confirmPasswordTextField resignFirstResponder];
    [_verificationCodeTextField resignFirstResponder];
    [_smsCodeTextField resignFirstResponder];
}

@end
