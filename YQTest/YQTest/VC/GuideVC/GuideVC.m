//
//  GuideVC.m
//  YQTest
//
//  Created by boli on 2019/1/9.
//  Copyright © 2019 boli. All rights reserved.
//

#import "GuideVC.h"

@interface GuideVC ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSArray *images;

@end

@implementation GuideVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.width)];
    _scrollView.center = self.view.center;
    [self.view addSubview:_scrollView];
//    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.centerX.centerY.mas_equalTo(self.view);
//        make.height.mas_equalTo(make.width);
//    }];
    _scrollView.backgroundColor = [UIColor redColor];
    
    _images = @[@"1.jpg", @"2.jpg"];
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width*_images.count, self.view.frame.size.height);
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    
    for (int i = 0; i < _images.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*_scrollView.width, 0, _scrollView.width, _scrollView.width)];
        imageView.image = [UIImage imageNamed:_images[i]];
        [_scrollView addSubview:imageView];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
