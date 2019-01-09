//
//  FGBaseRequest.h
//  FamilyGuard
//
//  Created by boli on 2018/7/2.
//  Copyright © 2018年 Mars. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPManager.h"
#import "HUDOperationManager.h"

typedef void (^SuccessHandler)(NSDictionary *object, id data, HTTPResponse *response);
typedef void (^FailureHandler)(HTTPResponse *response, NSError *error);


@interface YQBaseRequest : NSObject

@property (nonatomic, strong) MBProgressHUD *hud;

@property (nonatomic, strong) SHOperation *operation;

- (void)requestParameters:(NSDictionary *)parameters
                  success:(SuccessHandler)success
                  failure:(FailureHandler)failure;

- (void)requestParameters:(NSDictionary *)parameters
                  success:(SuccessHandler)success
                  failure:(FailureHandler)failure
                  showHud:(BOOL)showHud;

- (void)requestWithActionId:(NSInteger)actionId
                    success:(SuccessHandler)success
                    failure:(FailureHandler)failure;

- (void)requestWithActionId:(NSInteger)actionId
                    success:(SuccessHandler)success
                    failure:(FailureHandler)failure
                    showHud:(BOOL)showHud;

@end
