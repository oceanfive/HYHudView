//
//  HYHud.m
//  HYHudView
//
//  Created by ocean on 2017/11/20.
//  Copyright © 2017年 ocean. All rights reserved.
//

#import "HYHud.h"
#import "UIView+HYHud.h"
#import "AppDelegate.h"

@implementation HYHud

#pragma mark - 加载提示框
+ (void)hy_showTextOnly:(NSString *)text {
    [self hy_showTextOnly:text offset:CGPointZero];
}

+ (void)hy_showTextOnly:(NSString *)text offset:(CGPoint)offset {
    [self hy_showTextOnly:text offset:offset duration:1.5f];
}

+ (void)hy_showTextOnly:(NSString *)text offset:(CGPoint)offset duration:(NSTimeInterval)duration {
    [self hy_showTextOnly:text offset:offset contentColor:[UIColor colorWithWhite:0.f alpha:0.7f] duration:duration];
}

+ (void)hy_showTextOnly:(NSString *)text offset:(CGPoint)offset contentColor:(UIColor *)contentColor duration:(NSTimeInterval)duration {
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [app.window hy_showTextOnly:text offset:offset contentColor:contentColor duration:duration];
}

+ (void)hy_showText:(NSString *)text {
    [self hy_showText:text offset:CGPointZero];
}

+ (void)hy_showText:(NSString *)text offset:(CGPoint)offset {
    [self hy_showText:text offset:CGPointZero contentColor:[UIColor colorWithWhite:0.f alpha:0.7f]];
}

+ (void)hy_showText:(NSString *)text offset:(CGPoint)offset contentColor:(UIColor *)contentColor {
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [app.window hy_showText:text offset:offset contentColor:contentColor];
}


+ (void)hy_showImages:(NSArray *)images {
    [self hy_showImages:images text:@"" offset:CGPointZero];
}

+ (void)hy_showImages:(NSArray *)images text:(NSString *)text {
    [self hy_showImages:images text:text offset:CGPointZero];
}

+ (void)hy_showImages:(NSArray *)images text:(NSString *)text offset:(CGPoint)offset {
    [self hy_showImages:images duration:1.0f text:text offset:CGPointZero];
}

+ (void)hy_showImages:(NSArray *)images duration:(NSTimeInterval)duration text:(NSString *)text {
    [self hy_showImages:images duration:duration text:text offset:CGPointZero];
}

+ (void)hy_showImages:(NSArray *)images duration:(NSTimeInterval)duration text:(NSString *)text offset:(CGPoint)offset {
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [app.window hy_showImages:images duration:duration text:text offset:offset];
}


+ (void)hy_showCustomView:(UIView *)view {
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [app.window hy_showCustomView:view];
}

+ (void)hy_hide {
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [app.window hy_hide];
}

@end
