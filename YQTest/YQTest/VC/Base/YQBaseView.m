//
//  YQBaseView.m
//  YQTest
//
//  Created by boli on 2018/12/27.
//  Copyright © 2018 boli. All rights reserved.
//

#import "YQBaseView.h"

@implementation YQBaseView

+ (instancetype)xibInstancetype {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
}



- (void)dealloc {
    NSLog(@"%@",self);
}

@end
