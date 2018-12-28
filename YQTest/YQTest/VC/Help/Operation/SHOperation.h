//
//  FGOperation.h
//  FamilyGuard
//
//  Created by boli on 2018/7/26.
//  Copyright © 2018年 Mars. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^OperationHandler)(void);

@interface SHOperation : NSOperation

@property (nonatomic, copy) OperationHandler handler;

@property (nonatomic, assign) NSInteger identifer;

+ (instancetype)blockOperationWithBlock:(void (^)(void))block;

//- (void)done;

- (void)removeFromQueue;

@end
