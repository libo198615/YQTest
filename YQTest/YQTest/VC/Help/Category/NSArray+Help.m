//
//  NSArray+Help.m
//  APPHelp
//
//  Created by boli on 2018/8/7.
//  Copyright © 2018年 boli. All rights reserved.
//

#import "NSArray+Help.h"
#import "JRSwizzle.h"

@implementation NSArray (Help)

+ (void)load {
    [[NSArray class] jr_swizzleMethod:@selector(objectAtIndex:) withMethod:@selector(LB_objectAtIndex:) error:nil];
    
}

- (id)LB_objectAtIndex:(NSUInteger)index {
    if (index >= self.count) {
        NSLog(@"越界");
        return nil;
    } else {
        return [self LB_objectAtIndex:index];
    }
}

- (id)safeObjectAtIndex:(NSUInteger)index {
    if (index >= self.count) {
        return nil;
    }
    return [self objectAtIndex:index];
}





@end
