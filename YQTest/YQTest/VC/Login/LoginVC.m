//
//  LoginVC.m
//  YQTest
//
//  Created by boli on 2018/12/26.
//  Copyright © 2018 boli. All rights reserved.
//

#import "LoginVC.h"
#import "NSString+Help.h"

@interface LoginVC ()

@property (strong, nonatomic) IBOutlet UITextField *phoneTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;


@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)loginAction:(UIButton *)sender {
}

- (IBAction)forgetPasswordAction:(id)sender {
}
- (IBAction)registerAction:(id)sender {
}


- (IBAction)textFieldValueDidChanged:(id)sender {
    if (_phoneTextField.text.length <= 11 &&
        _passwordTextField.text.length >= 6 &&
        [_phoneTextField.text isNumber]) {

    } else {

    }
}

//- (BOOL)textFieldShouldReturn:(UITextField *)textField {
//    if (textField == _phoneNumberTextField) {
//        [_phoneNumberTextField becomeFirstResponder];
//        return NO;
//    } else {
//        [self registerBtnAction:nil];
//        return YES;
//    }
//    return YES;
//}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_phoneTextField resignFirstResponder];
    [_passwordTextField resignFirstResponder];
}

@end
