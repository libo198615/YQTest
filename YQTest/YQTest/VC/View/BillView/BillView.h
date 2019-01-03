//
//  BillView.h
//  YQTest
//
//  Created by boli on 2019/1/3.
//  Copyright © 2019 boli. All rights reserved.
//

#import "YQBaseView.h"

NS_ASSUME_NONNULL_BEGIN



@interface BillView : YQBaseView

@property (nonatomic, assign) BillStatus billStatus;

@property (strong, nonatomic) IBOutlet UIView *leftView;

@property (strong, nonatomic) IBOutlet UIView *line0;
@property (strong, nonatomic) IBOutlet UIView *line1;
@property (strong, nonatomic) IBOutlet UIView *line2;
@property (strong, nonatomic) IBOutlet UIView *line3;
@property (strong, nonatomic) IBOutlet UILabel *leftLabel0;
@property (strong, nonatomic) IBOutlet UILabel *leftLabel1;
@property (strong, nonatomic) IBOutlet UILabel *leftLabel2;
@property (strong, nonatomic) IBOutlet UILabel *leftLabel3;
@property (strong, nonatomic) IBOutlet UILabel *leftLabel4;

@property (strong, nonatomic) IBOutlet UILabel *rightLabel0;
@property (strong, nonatomic) IBOutlet UILabel *rightLabel1;
@property (strong, nonatomic) IBOutlet UILabel *rightLabel2;
@property (strong, nonatomic) IBOutlet UILabel *rightLabel3;
@property (strong, nonatomic) IBOutlet UILabel *rightLabel4;



@end

NS_ASSUME_NONNULL_END
