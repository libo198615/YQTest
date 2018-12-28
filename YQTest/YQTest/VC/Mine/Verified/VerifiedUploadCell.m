//
//  VerifiedUploadCell.m
//  YQTest
//
//  Created by boli on 2018/12/28.
//  Copyright © 2018 boli. All rights reserved.
//

#import "VerifiedUploadCell.h"

@implementation VerifiedUploadCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(uploadImage1:)];
    [_imageView1 addGestureRecognizer:tap1];
    _imageView1.tag = 1;
    
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(uploadImage2:)];
    [_imageView2 addGestureRecognizer:tap2];
    _imageView2.tag = 2;
    
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(uploadImage3:)];
    [_imageView3 addGestureRecognizer:tap3];
    _imageView3.tag = 3;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)uploadImage1:(UITapGestureRecognizer *)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(uploadImageToImageView:)]) {
        [_delegate uploadImageToImageView:_imageView1];
    }
}

- (void)uploadImage2:(UITapGestureRecognizer *)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(uploadImageToImageView:)]) {
        [_delegate uploadImageToImageView:_imageView2];
    }
}

- (void)uploadImage3:(UITapGestureRecognizer *)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(uploadImageToImageView:)]) {
        [_delegate uploadImageToImageView:_imageView3];
    }
}

- (IBAction)nextAction:(id)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(nextBtnSelected)]) {
        [_delegate nextBtnSelected];
    }
}






@end
