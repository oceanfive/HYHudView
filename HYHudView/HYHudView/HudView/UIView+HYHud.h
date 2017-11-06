//
//  UIView+HYHud.h
//  HYHudView
//
//  Created by ocean on 2017/11/6.
//  Copyright © 2017年 ocean. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (HYHud)

#pragma mark - 只显示文字
/**
 只显示文字，1.5秒之后消失
 
 @param text 显示的文字
 */
- (void)hy_showTextOnly:(NSString *)text;

/**
 只显示文字，1.5秒之后消失
 
 @param text 显示的文字
 @param offset 位置偏移量
 */
- (void)hy_showTextOnly:(NSString *)text offset:(CGPoint)offset;

/**
 只显示文字，给定时间之后消失
 
 @param text 显示的文字
 @param offset 位置偏移量
 @param duration 持续时间，即多少秒之后消失
 */
- (void)hy_showTextOnly:(NSString *)text offset:(CGPoint)offset duration:(NSTimeInterval)duration;

/**
 只显示文字，给定时间之后消失，可以设置文字颜色
 
 @param text 显示的文字
 @param offset 位置偏移量
 @param contentColor 文字的颜色
 @param duration 持续时间，即多少秒之后消失
 */
- (void)hy_showTextOnly:(NSString *)text offset:(CGPoint)offset contentColor:(UIColor *)contentColor duration:(NSTimeInterval)duration;

//-----------------------------------------------
#pragma mark - 显示文字和系统的菊花样式加载动画
/**
 显示文字和系统样式的加载动画，不会自己消失，需要调用方法hy_hide才会消失
 
 @param text 显示的文字
 */
- (void)hy_showText:(NSString *)text;

/**
 显示文字和系统样式的加载动画，不会自己消失，需要调用方法hy_hide才会消失
 
 @param text 显示的文字
 @param offset 位置偏移量
 */
- (void)hy_showText:(NSString *)text offset:(CGPoint)offset;

/**
 显示文字和系统样式的加载动画，不会自己消失，需要调用方法hy_hide才会消失
 
 @param text 显示的文字
 @param offset 位置偏移量
 @param contentColor 文字和加载动画的颜色
 */
- (void)hy_showText:(NSString *)text offset:(CGPoint)offset contentColor:(UIColor *)contentColor;

//-----------------------------------------------
#pragma mark - 显示自定义的动画
/**
 显示自定义的动画进度，动画持续时间为1秒
 
 @param images 动画图片数组
 */
- (void)hy_showImages:(NSArray *)images;

/**
 显示自定义的动画进度和文字，动画持续时间为1秒，
 
 @param images 动画图片数组
 @param text 显示的文字
 */
- (void)hy_showImages:(NSArray *)images text:(NSString *)text;

/**
 显示自定义的动画进度
 
 @param images 动画图片数组
 @param duration 动画持续时间
 */
- (void)hy_showImages:(NSArray *)images duration:(NSTimeInterval)duration text:(NSString *)text;

#pragma mark - 显示自定义控件
/**
 显示自定义的控件
 
 @param view 自定义的控件
 */
- (void)hy_showCustomView:(UIView *)view;

/**
 消失
 */
- (void)hy_hide;

@end

NS_ASSUME_NONNULL_END
