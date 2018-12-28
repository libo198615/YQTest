//
//  HTTPManager.m
//  SHParent
//
//  Created by boli on 2018/8/9.
//  Copyright © 2018年 boli. All rights reserved.
//

#import "HTTPManager.h"
#import "SHAlertController.h"

@interface HTTPManager ()


@end

@implementation HTTPManager

static HTTPManager *manager = nil;

+ (instancetype)shareManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    
    return manager;
}

+ (NSData *)getPostBodyWithParameters:(NSDictionary *)parameters
{
    
    
    return nil;
}

+ (AFURLSessionManager *)requestWithParameters:(NSDictionary *)parameters successBlock:(requestSuccess)successBlock failure:(requestFailure)failureBlock
{
    DebugLog(@"parameters = %@",parameters);
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    // 设置非校验证书模式
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    manager.securityPolicy.allowInvalidCertificates = YES;
    [manager.securityPolicy setValidatesDomainName:NO];
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:BaseURL parameters:nil error:nil];
    
    request.timeoutInterval = 10;
    [request setValue:@"application/octet-stream" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:[HTTPManager getPostBodyWithParameters:parameters]];
    
    AFHTTPResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializer];
    responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                                 @"text/html",
                                                 @"text/json",
                                                 @"text/javascript",
                                                 @"text/plain",
                                                 nil];
    manager.responseSerializer = responseSerializer;
    
    [[manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse *_Nonnull response, id _Nullable responseObject, NSError *_Nullable error) {
        if (responseObject) {
            DebugLog(@"%@", responseObject);
            HTTPResponse *responseModel = [HTTPResponse yy_modelWithJSON:responseObject];
        }
    }] resume];
    
    return manager;
}

+ (AFHTTPSessionManager *)upload:(void (^)(id <AFMultipartFormData> formData))dataBlock
                      parameters:(NSDictionary *)patameters
                        progress:(nullable void (^)(NSProgress * _Nonnull))uploadProgress
                    successBlock:(requestSuccess)successBlock
                    failureBlock:(requestFailure)failureBlock
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSSet *set = [NSSet setWithObjects:@"text/plain",
                  @"multipart/form-data",
                  @"application/json",
                  @"text/html", @"image/jpeg",
                  @"image/png",
                  @"application/octet-stream",
                  @"text/json", nil];
    manager.responseSerializer.acceptableContentTypes = set;
    
//    [manager POST:BaseUploadURL parameters:patameters constructingBodyWithBlock:dataBlock progress:uploadProgress success:^(NSURLSessionDataTask *_Nonnull task, NSDictionary *_Nullable responseObject) {
//        HTTPResponse *responseModel = [HTTPResponse mj_objectWithKeyValues:responseObject];
//        responseModel.message = [responseObject objectForKey:@"msg"];
//        successBlock(responseModel, responseObject);
//    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
//        HTTPResponse *responseModel = [[HTTPResponse alloc] init];
//        responseModel.message = @"服务器忙";
//        failureBlock(responseModel, error);
//    }];
    
    return manager;
}


@end
