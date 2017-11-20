//
//  UIView+HYHud.m
//  HYHudView
//
//  Created by ocean on 2017/11/6.
//  Copyright © 2017年 ocean. All rights reserved.
//

#import "UIView+HYHud.h"
#if __has_include(<MBProgressHUD/MBProgressHUD.h>)
#import <MBProgressHUD/MBProgressHUD.h>
#else
#import "MBProgressHUD.h"
#endif

@implementation UIView (HYHud)

#pragma mark - 加载提示框
- (void)hy_showTextOnly:(NSString *)text {
    [self hy_showTextOnly:text offset:CGPointZero];
}

- (void)hy_showTextOnly:(NSString *)text offset:(CGPoint)offset {
    [self hy_showTextOnly:text offset:offset duration:1.5f];
}

- (void)hy_showTextOnly:(NSString *)text offset:(CGPoint)offset duration:(NSTimeInterval)duration {
    [self hy_showTextOnly:text offset:offset contentColor:[UIColor colorWithWhite:0.f alpha:0.7f] duration:duration];
}

- (void)hy_showTextOnly:(NSString *)text offset:(CGPoint)offset contentColor:(UIColor *)contentColor duration:(NSTimeInterval)duration {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = text;
    hud.detailsLabel.text = @"";
    hud.offset = offset;
    hud.contentColor = contentColor;
    [hud hideAnimated:YES afterDelay:duration];
}


- (void)hy_showText:(NSString *)text {
    [self hy_showText:text offset:CGPointZero];
}

- (void)hy_showText:(NSString *)text offset:(CGPoint)offset {
    [self hy_showText:text offset:CGPointZero contentColor:[UIColor colorWithWhite:0.f alpha:0.7f]];
}

- (void)hy_showText:(NSString *)text offset:(CGPoint)offset contentColor:(UIColor *)contentColor {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.label.text = text;
//    hud.detailsLabel.text = text;
    hud.offset = offset;
    hud.contentColor = contentColor;
}


- (void)hy_showImages:(NSArray *)images {
    [self hy_showImages:images text:@"" offset:CGPointZero];
}

- (void)hy_showImages:(NSArray *)images text:(NSString *)text {
    [self hy_showImages:images text:text offset:CGPointZero];
}

- (void)hy_showImages:(NSArray *)images text:(NSString *)text offset:(CGPoint)offset {
    [self hy_showImages:images duration:1.0f text:text offset:CGPointZero];
}

- (void)hy_showImages:(NSArray *)images duration:(NSTimeInterval)duration text:(NSString *)text {
    [self hy_showImages:images duration:duration text:text offset:CGPointZero];
}

- (void)hy_showImages:(NSArray *)images duration:(NSTimeInterval)duration text:(NSString *)text offset:(CGPoint)offset {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 37, 37)];
    imageView.backgroundColor = [UIColor clearColor];
    [imageView setAnimationImages:images];
    imageView.animationDuration = duration;//设置动画时间
    imageView.animationRepeatCount = 0;//设置动画次数 0 表示无限
    [imageView startAnimating];//开始播放动画
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = imageView;
    hud.label.text = text;
    hud.offset = offset;
}

- (void)hy_showCustomView:(UIView *)view {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = view;
}

- (void)hy_hide {
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[MBProgressHUD class]]) {
            [obj removeFromSuperview];
        }
    }];
}

@end
