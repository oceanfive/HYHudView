//
//  UIImage+HYCategory.m
//  HYKit
//
//  Created by wuhaiyang on 2016/11/25.
//  Copyright © 2016年 wuhaiyang. All rights reserved.
//

#import "UIImage+HYCategory.h"
#import <math.h>

static inline double radians (double degrees) {
    return degrees * M_PI / 180;
}

@implementation UIImage (HYCategory)

+ (UIImage *)hy_createImageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)hy_getNewImageWithScale:(CGPoint)scale angle:(CGFloat)angle {
    CGFloat radian = radians(angle);
    CGSize size = CGSizeMake(self.size.width * scale.x, self.size.height * scale.y);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, size.width / 2, size.height / 2); //平移到中心位置
    CGContextRotateCTM(context, radian);
    CGContextScaleCTM(context, 1.0, -1.0); //坐标转换，上下翻转
    CGContextDrawImage(context, CGRectMake(- size.width / 2, - size.height / 2, size.width, size.height), self.CGImage); //图片需要最后进行绘制

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


- (UIImage *)hy_getNewImageWithScale:(CGFloat)scale orientation:(UIImageOrientation)orientation {
    return [UIImage imageWithCGImage:self.CGImage scale:scale orientation:orientation];
}

- (UIImage *)hy_getNewImageWithScale:(CGFloat)scale {
    return [self hy_getNewImageWithScale:scale orientation:self.imageOrientation];
}

- (UIImage *)hy_getNewImageWithOrientation:(UIImageOrientation)orientation {
    return [self hy_getNewImageWithScale:self.scale orientation:orientation];
}

#pragma mark - 图片镜像
- (UIImage *)hy_leftRightMirroredImage {
    return [self hy_getNewImageWithOrientation:UIImageOrientationUpMirrored];
}

- (UIImage *)hy_topBottomMirroredImage {
    return [self hy_getNewImageWithOrientation:UIImageOrientationDownMirrored];
}

- (UIImage *)hy_leftDiagonal45MirroredImage {
    return [self hy_getNewImageWithOrientation:UIImageOrientationLeftMirrored];
}

- (UIImage *)hy_rightDiagonal45MirroredImage {
    return [self hy_getNewImageWithOrientation:UIImageOrientationRightMirrored];
}

- (UIImage *)hy_getScaledImageWithScaleToSize:(CGSize)size {
    if (size.width <= 0 || size.height <= 0) return nil;
    UIGraphicsBeginImageContextWithOptions(size, NO, self.scale);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    //    [self drawAtPoint:CGPointZero];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
    /*
     @discussion
     这里两种方法“drawInRect”和“drawAtPoint”使用，产生的结果不一样,目前暂时使用drawInRect方法
     */
}

#pragma mark - 图片裁剪
- (UIImage *)hy_getCircleImageDefault {
    return [self hy_getCircleImageDefaultWithBorderWidth:0.0 borderColor:nil];
}

- (UIImage *)hy_getCircleImageWithCenter:(CGPoint)center radius:(CGFloat)radius {
    return [self hy_getCircleImageWithCenter:center radius:radius borderWidth:0.0 borderColor:nil];
}

- (UIImage *)hy_getCircleImageDefaultWithBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    CGSize size = CGSizeMake(self.size.width + borderWidth * 2, self.size.height + borderWidth * 2);
    return [self hy_getCircleImageWithCenter:CGPointMake(size.width / 2, size.height / 2)
                                      radius:MIN(self.size.width, self.size.height) / 2
                                 borderWidth:borderWidth
                                 borderColor:borderColor];
}

- (UIImage *)hy_getCircleImageWithCenter:(CGPoint)center radius:(CGFloat)radius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    UIBezierPath *pathIn = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:M_PI * 2 clockwise:YES]; //图片，圆形的内圈
    return [self hy_getClippedImageWithPath:pathIn.CGPath borderWidth:borderWidth borderColor:borderColor];
}

- (UIImage *)hy_getClippedImageWithPath:(CGPathRef)path borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    CGSize size = CGSizeMake(self.size.width + borderWidth * 2, self.size.height + borderWidth * 2); //左和右，所以是2倍,否则边框不是圆形，存在“平的”情况
    UIGraphicsBeginImageContextWithOptions(size, NO, 0); //NO，表示被裁剪的区域透明，YES，表示被裁剪的区域为黑色
    CGContextRef context = UIGraphicsGetCurrentContext();  //获取当前图形上下文
    CGContextSetLineWidth(context, borderWidth);  //设置线宽
    CGContextSetStrokeColorWithColor(context, borderColor.CGColor); //线宽颜色
    CGContextAddPath(context, path); //添加绘制路径
    CGContextDrawPath(context, kCGPathStroke); //绘制路径
    CGContextAddPath(context, path); //添加裁剪路径
    CGContextClip(context); //裁剪
    [self drawAtPoint:CGPointMake(borderWidth, borderWidth)]; //这里操作顺序，需要先执行裁剪，再绘制图片到图形上下文中
//    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
    /*
     drawAtPoint会自动缩放图片，保持原来的形状
     drawInRect不会自动缩放图片，在原来图片形状大小上进行裁剪
     */
}

#pragma mark - 给图片添加水印
- (UIImage *)hy_getTextStampImageAtRect:(CGRect)rect text:(NSString *)text dict:(NSDictionary *)dict {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    [self drawAtPoint:CGPointZero];
    [text drawInRect:rect withAttributes:dict];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)hy_getImageStampImageAtRect:(CGRect)rect image:(UIImage *)image {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    [self drawAtPoint:CGPointZero];
    [image drawInRect:rect];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

#pragma mark - 图片渲染
- (UIImage *)hy_getOriginalImage {
    return [self imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
