//
//  RegisterVC.m
//  YQTest
//
//  Created by boli on 2018/12/27.
//  Copyright © 2018 boli. All rights reserved.
//

#import "RegisterVC.h"
#import <JKCountDownButton.h>
#import "PooCodeView.h"
#import "Header.h"

@interface RegisterVC ()

@property (strong, nonatomic) IBOutlet UITextField *phoneTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UITextField *confirmPasswordTextField;
@property (strong, nonatomic) IBOutlet UITextField *verificationCodeTextField;
@property (strong, nonatomic) IBOutlet UITextField *SMSCodeTextField;
@property (strong, nonatomic) IBOutlet JKCountDownButton *verificationBtn;
@property (strong, nonatomic) IBOutlet PooCodeView *smsView;
@property (strong, nonatomic) IBOutlet UILabel *termsOfServiceLabel;
@property (strong, nonatomic) IBOutlet UILabel *loginLabel;


@end

@implementation RegisterVC

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

- (IBAction)registerAction:(UIButton *)sender {
}



- (void)fetchVerificationCode {
    WeakSelf;
    [HUD showHUDAddToView:self.view];
//    [SHGetVerificationCodeRequest requestWithPhoneNumber:_phoneTextField.text verificationCodeType:VerificationCodeTypeRegister success:^(NSDictionary *object, id data, HTTPResponse *response)
//     {
//         // 获取验证码按钮处理
//         [weakSelf.verificationCodeBtn startCountDownWithSecond:VerificationWaitSecond];
//         weakSelf.verificationCodeBtn.backgroundColor = COLOR_can_not_select;
//         [weakSelf.verificationCodeBtn countDownChanging:^NSString *(JKCountDownButton *countDownButton, NSUInteger second) {
//             countDownButton.enabled = NO;
//             NSString *title = [NSString stringWithFormat:@"%lus重新获取",(unsigned long)second];
//             return second==0?@"重新获取":title;
//         }];
//
//         // 返回结果处理
//         [weakSelf.verificationTextField becomeFirstResponder];
//         [HUD hideInView:weakSelf.view];
//         [HUD showHTTPMessage:response.message];
//#warning delete
//         if (product) {
//
//         } else {
//             weakSelf.verificationTextField.text = [object objectForKey:@"shortCode"];
//         }
//         [[NSUserDefaults standardUserDefaults] setObject:weakSelf.phoneTextField.text forKey:USER_PHONE];
//     } failure:^(HTTPResponse *response, NSError *error) {
//         [HUD hideInView:weakSelf.view];
//         if (response.code == 3001) {
//             [SHAlertController alertTitle:response.message message:nil determine:@"登录" cancel:@"取消" determineHandler:^{
//                 [weakSelf.navigationController popViewControllerAnimated:YES];
//             } cancelHandler:^{
//
//             }];
//         } else {
//             [HUD showHTTPMessage:response.message];
//         }
//     }];
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
    [_SMSCodeTextField resignFirstResponder];
}

@end
