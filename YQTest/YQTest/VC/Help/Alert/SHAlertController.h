//
//  FGAlertController.h
//  FamilyGuard
//
//  Created by boli on 2018/7/17.
//  Copyright © 2018年 Mars. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SHAlertController : NSObject

+ (void)alertTitle:(NSString *)title
           message:(NSString *)message
         determine:(NSString *)determine
            cancel:(NSString *)cancel
  determineHandler:(void (^)(void))determineHandler
     cancelHandler:(void (^)(void))cancelHandler;

+ (void)alertTitle:(NSString *)title
           message:(NSString *)message
         determine:(NSString *)determine
  determineHandler:(void (^)(void))determineHandler;

+ (void)sheetTitle:(NSString *)title
           message:(NSString *)message
      actionTitles:(NSArray *)actionTitles
  determineHandler:(void (^)(NSInteger index))determineHandler;

@end
