//
//  HUDOperationManager.h
//  SHParent
//
//  Created by boli on 2018/9/11.
//  Copyright © 2018年 boli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SHOperation.h"

@interface HUDOperationManager : NSObject

@property (nonatomic, assign) NSInteger identifer;

@property (nonatomic, strong) NSOperationQueue *queue;

@property (strong, nonatomic, nonnull) dispatch_semaphore_t lock;

@property (nonatomic, strong) NSMutableArray *operations;

+ (instancetype)manager;

- (SHOperation *)addOperation:(void (^)(void))block;

@end
