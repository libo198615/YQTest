//
//  FGOperation.m
//  FamilyGuard
//
//  Created by boli on 2018/7/26.
//  Copyright © 2018年 Mars. All rights reserved.
//

#import "SHOperation.h"

@interface SHOperation ()

@property (assign, nonatomic, getter = isExecuting) BOOL executing;

@property (assign, nonatomic, getter = isFinished) BOOL finished;

@property (nonatomic, assign) BOOL hasStart;

@end

@implementation SHOperation
@synthesize executing = _executing;
@synthesize finished = _finished;

+ (instancetype)blockOperationWithBlock:(void (^)(void))block {
    SHOperation *operation = [[SHOperation alloc] init];
    operation.handler = block;
    return operation;
}

- (void)start {
    _hasStart = YES;
    @synchronized (self) {
        if (self.isCancelled) {
            self.finished = YES;
            return;
        }
        if (_handler) {
            _handler();
        } else {
            [self done];
        }
    }
}

- (void)cancel {
    [super cancel];
    self.finished = YES;
}

- (void)done {
    self.finished = YES;
    self.executing = NO;
}


- (void)setFinished:(BOOL)finished {
    [self willChangeValueForKey:@"isFinished"];
    _finished = finished;
    [self didChangeValueForKey:@"isFinished"];
}

- (void)setExecuting:(BOOL)executing {
    [self willChangeValueForKey:@"isExecuting"];
    _executing = executing;
    [self didChangeValueForKey:@"isExecuting"];
}

- (void)removeFromQueue {
    if (!_hasStart) {
        _handler = nil;
    } else {
        [self done];
    }
}

@end
