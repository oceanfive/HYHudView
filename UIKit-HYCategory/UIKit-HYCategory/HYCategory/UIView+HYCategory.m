//
//  UIView+HYCategory.m
//  Category
//
//  Created by wuhaiyang on 16/8/24.
//  Copyright © 2016年 wuhaiyang. All rights reserved.
//

#import "UIView+HYCategory.h"

@implementation UIView (HYCategory)

#pragma mark - 快速 set 和 get 方法
- (CGFloat)hy_left {
    return self.frame.origin.x;
}

- (void)setHy_left:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)hy_top {
    return self.frame.origin.y;
}

- (void)setHy_top:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)hy_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setHy_right:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)hy_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setHy_bottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)hy_width {
    return self.frame.size.width;
}

- (void)setHy_width:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)hy_height {
    return self.frame.size.height;
}

- (void)setHy_height:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)hy_centerX {
    return self.center.x;
}

- (void)setHy_centerX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)hy_centerY {
    return self.center.y;
}

- (void)setHy_centerY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)hy_origin {
    return self.frame.origin;
}

- (void)setHy_origin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)hy_size {
    return self.frame.size;
}

- (void)setHy_size:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

#pragma mark - 截屏
- (UIImage *)hy_screenCapture {
    return [self hy_screenCaptureAtArea:[UIScreen mainScreen].bounds.size];
}

- (UIImage *)hy_screenCaptureAtArea:(CGSize)area {
    if (CGRectIsEmpty(self.frame)) return nil;
    UIGraphicsBeginImageContextWithOptions(area, NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    if ([self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
        [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
    } else {
        [self.layer renderInContext:context];
    }
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
