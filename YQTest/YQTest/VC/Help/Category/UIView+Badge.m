//
//  UIView+Badge.m
//  YQTest
//
//  Created by boli on 2019/1/5.
//  Copyright © 2019 boli. All rights reserved.
//

#import "UIView+Badge.h"
#import <objc/runtime.h>

static char LB_badgeLabelKey;

static CGFloat LB_badgeHeight = 15;

@implementation UIView (Badge)


- (void)LB_setBadgeNumber:(NSInteger)badgeNumber {
    NSString *badgeStr = [NSString stringWithFormat:@"%ld",badgeNumber];
    if (badgeStr == nil || [badgeStr isEqualToString:@""] || [badgeStr integerValue] <= 0) {
        UILabel *badgeLabel = objc_getAssociatedObject(self, &LB_badgeLabelKey);
        if (badgeLabel) {
            [badgeLabel removeFromSuperview];
        }
    } else {
        [self setNumber:badgeStr color:[UIColor redColor] font:[UIFont systemFontOfSize:[UIFont smallSystemFontSize]] center:CGPointZero];
    }
}

- (void)LB_setBadgeNumber:(NSInteger)badgeNumber center:(CGPoint)center {
    NSString *badgeStr = [NSString stringWithFormat:@"%ld",badgeNumber];
    if (badgeStr == nil || [badgeStr isEqualToString:@""] || [badgeStr integerValue] <= 0) {
        UILabel *badgeLabel = objc_getAssociatedObject(self, &LB_badgeLabelKey);
        if (badgeLabel) {
            [badgeLabel removeFromSuperview];
        }
    } else {
        [self setNumber:badgeStr color:[UIColor redColor] font:[UIFont systemFontOfSize:[UIFont smallSystemFontSize]] center:center];
    }
}

- (void)setNumber:(NSString *)number color:(UIColor *)color font:(UIFont *)font center:(CGPoint)center {
    UILabel *label = [self LB_badgeLabel];
    CGSize size = [number boundingRectWithSize:CGSizeMake(MAXFLOAT, LB_badgeHeight)
                                       options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font}
                                       context:nil].size;
    if (size.width < size.height) {
        size.width = size.height;
    }
    label.frame = CGRectMake(self.frame.size.width-size.width-2, 2, size.width, size.height);
    if (center.x != 0 && center.y != 0) {
        label.center = center;
    }
    label.layer.cornerRadius = LB_badgeHeight / 2;
    label.layer.masksToBounds = YES;
    label.font = [UIFont systemFontOfSize:[UIFont smallSystemFontSize]];
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = color;
    label.text = number;
}

- (UILabel *)LB_badgeLabel {
    UILabel *badgeLabel = objc_getAssociatedObject(self, &LB_badgeLabelKey);
    if (!badgeLabel) {
        badgeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        badgeLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:badgeLabel];
        [self bringSubviewToFront:badgeLabel];
        
        objc_setAssociatedObject(self, &LB_badgeLabelKey, badgeLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    
    
    return badgeLabel;
}





@end
