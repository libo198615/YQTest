//
//  HTTPResponse.h
//  SHParent
//
//  Created by boli on 2018/8/9.
//  Copyright © 2018年 boli. All rights reserved.
//

#import "YQBaseModel.h"

@interface HTTPResponse : YQBaseModel

@property (nonatomic, strong) NSString *message;

@property (nonatomic, assign) NSInteger code;



@end
