//
//  AccountModel.h
//  YQTest
//
//  Created by boli on 2018/12/26.
//  Copyright © 2018 boli. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AccountModel : NSObject

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *interestRate;

@property (nonatomic, strong) NSString *amount;

@property (nonatomic, strong) NSString *expiryDate;

@end

NS_ASSUME_NONNULL_END
