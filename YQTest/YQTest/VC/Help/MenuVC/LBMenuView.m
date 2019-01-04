//
//  LBMenuView.m
//  YQTest
//
//  Created by boli on 2019/1/2.
//  Copyright © 2019 boli. All rights reserved.
//

#import "LBMenuView.h"
#import <Masonry.h>

@interface LBMenuView ()

@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSMutableArray *btns;
@property (nonatomic, strong) NSMutableArray *titleWidth;
@property (nonatomic, strong) UIView *line;

@end

@implementation LBMenuView

- (instancetype)init {
    if (self = [super init]) {
        _titleFont = [UIFont systemFontOfSize:14];
        _lineColor = [UIColor yellowColor];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _titleFont = [UIFont systemFontOfSize:14];
        _lineColor = [UIColor yellowColor];
    }
    return self;
}

- (void)setTitles:(NSArray *)titles {
    _titles = titles;
    [self layoutDefaultSubViews];
}

- (void)layoutDefaultSubViews {
    _titleWidth = [NSMutableArray array];
    _btns = [NSMutableArray array];
    for (int i = 0; i < _titles.count; i ++) {
        UIButton *btn = [[UIButton alloc] init];
        [btn setTitle:_titles[i] forState:UIControlStateNormal];
        btn.tag = i;
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [_btns addObject:btn];
        
        CGSize size = [_titles[i] sizeWithAttributes:@{NSFontAttributeName:_titleFont}];
        [_titleWidth addObject:[NSNumber numberWithFloat:size.width]];
    }
    
    UIStackView *stackView = [[UIStackView alloc] initWithArrangedSubviews:[NSArray arrayWithArray:_btns]];
    stackView.frame = self.bounds;
    [self addSubview:stackView];
    stackView.distribution = UIStackViewDistributionFillEqually;
    
    
    _line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [_titleWidth[0] floatValue], 2)];
    _line.backgroundColor = _lineColor;
    [self addSubview:_line];
    float width = [_titleWidth[0] floatValue];
    _line.frame = CGRectMake((self.frame.size.width/_titles.count-width)/2, self.frame.size.height-5, width, 2);
}

- (void)btnAction:(UIButton *)button {
    [self selectAnimation:button];
    
    if (_delegate && [_delegate respondsToSelector:@selector(selectTitleAtIndex:)]) {
        [_delegate selectTitleAtIndex:button.tag];
    }
}

- (void)selectAnimation:(UIButton *)button {
    float width = [_titleWidth[button.tag] floatValue];
    __weak __typeof__(self) weakSelf = self;
    [UIView animateWithDuration:0.3 animations:^{
        weakSelf.line.frame = CGRectMake(self.frame.size.width/weakSelf.titles.count*button.tag + (self.frame.size.width/weakSelf.titles.count-width)/2, self.frame.size.height-5, width, 2);
    }];
    _currentIndex = button.tag;
}

- (void)setSelectedTitleAtIndex:(NSInteger)index {
    UIButton *button = _btns[index];
    [self selectAnimation:button];
}

@end
