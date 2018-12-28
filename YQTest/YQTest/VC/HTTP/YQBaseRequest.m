//
//  FGBaseRequest.m
//  FamilyGuard
//
//  Created by boli on 2018/7/2.
//  Copyright © 2018年 Mars. All rights reserved.
//

#import "YQBaseRequest.h"


@implementation YQBaseRequest


- (void)requestParameters:(NSDictionary *)parameters
                  success:(SuccessHandler)success
                  failure:(FailureHandler)failure
{
    [[[YQBaseRequest alloc] init] requestParameters:parameters success:success failure:failure showHud:YES];
}

- (void)requestParameters:(NSDictionary *)parameters
                  success:(SuccessHandler)success
                  failure:(FailureHandler)failure
                  showHud:(BOOL)showHud
{
    WeakSelf
    StrongSelf
    if (showHud) {
        _operation = [[HUDOperationManager manager] addOperation:^{
           weakSelf.hud = [HUD showHUD];
        }];
    }
    [HTTPManager requestWithParameters:parameters successBlock:^(HTTPResponse *response, NSDictionary *object) {
        if (showHud) {
            [strongSelf.hud hideAnimated:NO];
            [strongSelf.operation removeFromQueue];
//            weakSelf.operation = [[HUDOperationManager manager] addOperation:^{
                [HUD showHTTPMessage:[object objectForKey:@"message"]];
//            }];
        }
        if (success) {
            success(object, nil, response);
        }
    } failure:^(HTTPResponse *response, NSError *error) {
        if (showHud) {
            [strongSelf.hud hideAnimated:NO];
            [strongSelf.operation removeFromQueue];
//            weakSelf.operation = [[HUDOperationManager manager] addOperation:^{
                [HUD showHTTPMessage:response.message];
//            }];
        }
        if (failure) {
            failure(response, error);
        }
    }];
}

- (void)requestWithActionId:(NSInteger)actionId
                    success:(SuccessHandler)success
                    failure:(FailureHandler)failure
{
    [self requestWithActionId:actionId success:success failure:failure showHud:YES];
}

- (void)requestWithActionId:(NSInteger)actionId
                    success:(SuccessHandler)success
                    failure:(FailureHandler)failure
                    showHud:(BOOL)showHud
{
    WeakSelf
    StrongSelf
    if (showHud) {
        _operation = [[HUDOperationManager manager] addOperation:^{
            weakSelf.hud = [HUD showHUD];
        }];
    }
    NSDictionary *parameters = @{ @"actionId" : [NSNumber numberWithInteger:actionId] };

    [HTTPManager requestWithParameters:parameters successBlock:^(HTTPResponse *response, NSDictionary *object) {
        if (success) {
            success(object, nil, response);
        }
        if (showHud) {
            [strongSelf.hud hideAnimated:NO];
            [strongSelf.operation removeFromQueue];
            [HUD showHTTPMessage:[object objectForKey:@"message"]];
        }
    } failure:^(HTTPResponse *response, NSError *error) {
        if (failure) {
            failure(response, error);
        }
        if (showHud) {
            [strongSelf.hud hideAnimated:NO];
            [strongSelf.operation removeFromQueue];
            [HUD showHTTPMessage:response.message];
        }
    }];
}


- (void)dealloc {}

@end
