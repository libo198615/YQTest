//
//  SellerInfomationView.h
//  YQTest
//
//  Created by boli on 2018/12/27.
//  Copyright © 2018 boli. All rights reserved.
//

#import "YQBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface SellerInfomationView : YQBaseView

@property (strong, nonatomic) IBOutlet UILabel *label0;
@property (strong, nonatomic) IBOutlet UILabel *label1;
@property (strong, nonatomic) IBOutlet UILabel *label2;

@property (strong, nonatomic) IBOutlet UILabel *companyLabel;
@property (strong, nonatomic) IBOutlet UILabel *legalPersonLabel;

- (void)setCompany:(NSString *)company legalPerson:(NSString *)legalPerson;

@end

NS_ASSUME_NONNULL_END
