//
//  HomeCell.m
//  YQTest
//
//  Created by boli on 2018/12/26.
//  Copyright © 2018 boli. All rights reserved.
//

#import "HomeCell.h"

@implementation HomeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _bgView = [[UIView alloc] init];
    [self.contentView addSubview:_bgView];
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView);
        make.left.mas_equalTo(self.contentView).mas_offset(15);
        make.right.mas_equalTo(self.contentView).mas_offset(-15);
        make.height.mas_equalTo(110);
    }];

    


    _topView = [[UIView alloc] init];
    [_bgView addSubview:_topView];
    _topView.backgroundColor = [UIColor hex:@"548AE8"];
    [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.bgView);
        make.height.mas_equalTo(3);
    }];

    _titleLable = [[UILabel alloc] init];
    [_bgView addSubview:_titleLable];
    [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bgView).mas_offset(15);
        make.left.mas_equalTo(self.bgView).mas_offset(30);
    }];
    _titleLable.textColor = [UIColor hex:@"333333"];
    _titleLable.font = [UIFont systemFontOfSize:12];

    //  利率
    _interrestRateLabel = [[UILabel alloc] init];
    [_bgView addSubview:_interrestRateLabel];
    [_interrestRateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.bgView).mas_offset(-15);
        make.left.mas_equalTo(self.bgView);
    }];
    _interrestRateLabel.font = [UIFont systemFontOfSize:12];
    _interrestRateLabel.textColor = [UIColor hex:@"8B9199"];
    _interrestRateLabel.textAlignment = NSTextAlignmentCenter;

    _interrestRateNumberLabel = [[UILabel alloc] init];
    [_bgView addSubview:_interrestRateNumberLabel];
    [_interrestRateNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.left.mas_equalTo(self.interrestRateLabel);
        make.bottom.mas_equalTo(self.interrestRateLabel.mas_top).mas_offset(-2);
    }];
    _interrestRateNumberLabel.textColor = [UIColor hex:@"EC544F"];
    _interrestRateNumberLabel.font = [UIFont boldSystemFontOfSize:28];
    _interrestRateNumberLabel.textAlignment = NSTextAlignmentCenter;


    // 金额
    _amountLabel = [[UILabel alloc] init];
    [_bgView addSubview:_amountLabel];
    [_amountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.width.mas_equalTo(self.interrestRateLabel);
        make.left.mas_equalTo(self.interrestRateLabel.mas_right).mas_offset(2);
    }];
    _amountLabel.font = [UIFont systemFontOfSize:12];
    _amountLabel.textColor = [UIColor hex:@"8B9199"];
    _amountLabel.textAlignment = NSTextAlignmentCenter;

    _amountNumberLabel = [[UILabel alloc] init];
    [_bgView addSubview:_amountNumberLabel];
    [_amountNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.left.mas_equalTo(self.amountLabel);
        make.centerY.mas_equalTo(self.interrestRateNumberLabel);
    }];
    _amountNumberLabel.textColor = [UIColor hex:@"EC544F"];
    _amountNumberLabel.font = [UIFont boldSystemFontOfSize:28];
    _amountNumberLabel.textAlignment = NSTextAlignmentCenter;

    // 到期日
    _expiryDateLabel = [[UILabel alloc] init];
    [_bgView addSubview:_expiryDateLabel];
    [_expiryDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.amountLabel);
        make.left.mas_equalTo(self.amountLabel.mas_right).mas_offset(2);
        make.right.mas_equalTo(self.bgView);
        make.width.mas_equalTo(self.amountLabel).multipliedBy(1.2);
    }];
    _expiryDateLabel.font = [UIFont systemFontOfSize:12];
    _expiryDateLabel.textColor = [UIColor hex:@"8B9199"];
    _expiryDateLabel.textAlignment = NSTextAlignmentCenter;

    _expiryDateNumberLabel = [[UILabel alloc] init];
    [_bgView addSubview:_expiryDateNumberLabel];
    [_expiryDateNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.left.mas_equalTo(self.expiryDateLabel);
        make.centerY.mas_equalTo(self.amountNumberLabel);
    }];
    _expiryDateNumberLabel.textColor = [UIColor hex:@"333333"];
    _expiryDateNumberLabel.font = [UIFont boldSystemFontOfSize:18];
    _expiryDateNumberLabel.textAlignment = NSTextAlignmentCenter;

    _segmentationView0 = [[UIView alloc] init];
    _segmentationView0.backgroundColor = [UIColor hex:@"F2F2F2"];
    [_bgView addSubview:_segmentationView0];
    [_segmentationView0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.interrestRateLabel.mas_right);
        make.bottom.mas_equalTo(self.interrestRateLabel).mas_offset(-7);
        make.top.mas_equalTo(self.interrestRateNumberLabel).mas_offset(7);
        make.width.mas_equalTo(1);
    }];

    _segmentationView1 = [[UIView alloc] init];
    _segmentationView1.backgroundColor = [UIColor hex:@"F2F2F2"];
    [_bgView addSubview:_segmentationView1];
    [_segmentationView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.amountLabel.mas_right);
        make.top.width.height.mas_equalTo(self.segmentationView0);
    }];
    
    UIView *shadowView = [[UIView alloc] init];
    shadowView.backgroundColor = [UIColor whiteColor];
    [shadowView showShadowWithColor:[UIColor blackColor]];
    [self.contentView addSubview:shadowView];
    [self.contentView sendSubviewToBack:shadowView];
    [shadowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.mas_equalTo(self.contentView).mas_offset(-15);
        make.left.mas_equalTo(self.contentView).mas_offset(15);
        make.top.mas_equalTo(self.contentView);
    }];
}

- (void)setModel:(AccountModel *)model {
    _model = model;
    
    _titleLable.text = _model.title;
    _interrestRateLabel.text = @"年利率";
    _amountLabel.text = @"标的金额";
    _expiryDateLabel.text = @"到期日";
    
    {
        NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%%",_model.interestRate]];
        [text yy_setFont:[UIFont systemFontOfSize:14] range:NSMakeRange(text.length-1, 1)];
        _interrestRateNumberLabel.attributedText = text;
    }
    {
        NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@万",_model.amount]];
        [text yy_setFont:[UIFont systemFontOfSize:14] range:NSMakeRange(text.length-1, 1)];
        _amountNumberLabel.attributedText = text;
    }
    _expiryDateNumberLabel.text = _model.expiryDate;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
