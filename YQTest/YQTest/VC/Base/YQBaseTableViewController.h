//
//  YQBaseTableViewController.h
//  YQTest
//
//  Created by boli on 2018/12/26.
//  Copyright © 2018 boli. All rights reserved.
//

#import "YQBaseViewController.h"
#import "Header.h"

NS_ASSUME_NONNULL_BEGIN

@interface YQBaseTableViewController : YQBaseViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *items;




@end

NS_ASSUME_NONNULL_END
