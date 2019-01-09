//
//  FGAlertController.m
//  FamilyGuard
//
//  Created by boli on 2018/7/17.
//  Copyright © 2018年 Mars. All rights reserved.
//

#import "SHAlertController.h"
#import "UIViewController+help.h"

@implementation SHAlertController

+ (void)alertTitle:(NSString *)title
           message:(NSString *)message
         determine:(NSString *)determine
            cancel:(NSString *)cancel
  determineHandler:(void (^)(void))determineHandler
     cancelHandler:(void (^)(void))cancelHandler
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancel style:UIAlertActionStyleCancel handler:^(UIAlertAction *_Nonnull action) {
        if (cancelHandler) {
            cancelHandler();
        }
    }];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:determine style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {
        if (determineHandler) {
            determineHandler();
        }
    }];
    if (cancel) {
        [alert addAction:cancelAction];
    }
    [alert addAction:sureAction];

    [[UIViewController currentViewController] presentViewController:alert animated:YES completion:nil];
}

+ (void)alertTitle:(NSString *)title
           message:(NSString *)message
         determine:(NSString *)determine
  determineHandler:(void (^)(void))determineHandler
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:determine style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {
        if (determineHandler) {
            determineHandler();
        }
    }];
    [alert addAction:sureAction];

    [[UIViewController currentViewController] presentViewController:alert animated:YES completion:nil];
}

+ (void)sheetTitle:(NSString *)title
           message:(NSString *)message
       actionTitles:(NSArray *)actionTitles
  determineHandler:(void (^)(NSInteger index))determineHandler
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    for (int i = 0; i < actionTitles.count; i ++) {
        NSString *str = actionTitles[i];
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:str style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {
            if (determineHandler) {
                determineHandler(i);
            }
        }];
        [alert addAction:sureAction];
    }
    
    [[UIViewController currentViewController] presentViewController:alert animated:YES completion:nil];
}


@end
