//
//  VerifiedUploadCell.h
//  YQTest
//
//  Created by boli on 2018/12/28.
//  Copyright © 2018 boli. All rights reserved.
//

#import "YQBaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@protocol VerifiedUploadCellDelegate <NSObject>

- (void)nextBtnSelected;

- (void)uploadImageToImageView:(UIImageView *)imageView;

@end

@interface VerifiedUploadCell : YQBaseTableViewCell

@property (nonatomic, weak) id <VerifiedUploadCellDelegate> delegate;

@property (strong, nonatomic) IBOutlet UIImageView *imageView1;
@property (strong, nonatomic) IBOutlet UIImageView *imageView2;
@property (strong, nonatomic) IBOutlet UIImageView *imageView3;

@property (strong, nonatomic) IBOutlet UILabel *contentLabel;
@property (strong, nonatomic) IBOutlet UIButton *nextBtn;


@end

NS_ASSUME_NONNULL_END
