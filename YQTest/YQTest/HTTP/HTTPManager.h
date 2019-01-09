//
//  HTTPManager.h
//  SHParent
//
//  Created by boli on 2018/8/9.
//  Copyright © 2018年 boli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Header.h"
#import <AFNetworking/AFNetworking.h>
#import "HTTPResponse.h"

typedef void (^requestSuccess)(HTTPResponse *response, NSDictionary *object);

typedef void (^requestFailure)(HTTPResponse *response, NSError *error);

@interface HTTPManager : NSObject

+ (AFURLSessionManager *)requestWithParameters:(NSDictionary *)parameters successBlock:(requestSuccess)successBlock failure:(requestFailure)failureBlock;

+ (AFHTTPSessionManager *)upload:(void (^)(id <AFMultipartFormData> formData))dataBlock
                      parameters:(NSDictionary *)patameters
                        progress:(nullable void (^)(NSProgress * _Nonnull))uploadProgress
                    successBlock:(requestSuccess)successBlock
                    failureBlock:(requestFailure)failureBlock;

@end
