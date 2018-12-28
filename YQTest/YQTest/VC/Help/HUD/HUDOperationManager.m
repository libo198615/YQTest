//
//  HUDOperationManager.m
//  SHParent
//
//  Created by boli on 2018/9/11.
//  Copyright © 2018年 boli. All rights reserved.
//

#import "HUDOperationManager.h"
#import "Header.h"

@implementation HUDOperationManager

static HUDOperationManager *manager = nil;

+ (instancetype)manager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[HUDOperationManager alloc] init];
        manager.lock = dispatch_semaphore_create(1);
        manager.operations = [NSMutableArray array];
    });
    return manager;
}

//- (SHOperation *)addOperation:(void (^)(void))block {
//    return [self addOperation:block completion:nil];
//}

- (SHOperation *)addOperation:(void (^)(void))block {
    if (!_queue) {
//        _queue = [[NSOperationQueue alloc] init];
//        _queue.name = @"HUD";
        _queue = [NSOperationQueue mainQueue];
        _queue.maxConcurrentOperationCount = 1;
    }
    SHOperation *operation = [SHOperation blockOperationWithBlock:block];
    operation.identifer = _identifer;
    _identifer ++;
    
    [_queue addOperation:operation];
    
    return operation;
}




@end
