//
//  SetPasswordVC.m
//  YQTest
//
//  Created by boli on 2019/1/8.
//  Copyright © 2019 boli. All rights reserved.
//

#import "SetPasswordVC.h"
#import "SetPasswordItem.h"
#import "UITextField+Help.h"

@interface SetPasswordVC () <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UIButton *nextBtn;
@property (nonatomic, strong) NSMutableArray *items;

@property (nonatomic, strong) UITextField *textField;

@end

@implementation SetPasswordVC

+ (NSString *)storyboardName {
    return @"Mine";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _items = [NSMutableArray array];
    float left = 40;
    float width = ([UIScreen mainScreen].bounds.size.width-left*2)/6;
    for (int i = 0; i < 6; i++) {
        SetPasswordItem *item = [[SetPasswordItem alloc] init];
        [_items addObject:item];
        [self.view addSubview:item];
        [item mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(width+1);
            make.height.mas_equalTo(width);
            make.left.mas_equalTo((left+(width+1)*i-i));
            make.top.mas_equalTo(150);
        }];
    }
    
    
    
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.view addSubview:_textField];
    _textField.hidden = YES;
    _textField.keyboardType = UIKeyboardTypeNumberPad;
    _textField.maxLength = 6;
//    [_textField becomeFirstResponder];
    _textField.delegate = self;
    [_textField addTarget:self action:@selector(textFieldChange:) forControlEvents:UIControlEventEditingChanged];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [_textField becomeFirstResponder];
}

- (IBAction)nextBtnAction:(UIButton *)sender {
}



- (void)textFieldChange:(UITextField *)textField {
    for (int i = 0; i < 6; i ++) {
        SetPasswordItem *item = _items[i];
        if (i < textField.text.length) {
            [item showIdentify];
        } else {
            [item hideIdentify];
        }
    }
}


@end
