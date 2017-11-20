//
//  UIImage+HYCategory.h
//  HYKit
//
//  Created by wuhaiyang on 2016/11/25.
//  Copyright © 2016年 wuhaiyang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (HYCategory)

/**
 根据颜色生成一张给定尺寸的图片
 
 @param color 颜色
 @param size  范围
 @return 图片
 */
+ (UIImage *)hy_createImageWithColor:(UIColor *)color size:(CGSize)size;


//--------------------------------------------------------------
#pragma mark - 旋转和缩放
/**
 旋转和缩放图片，这个方法不同于系统的方法，可以连续的进行缩放或者旋转

 @param scale 缩放大小;x和y方向的缩放;
 @param angle 旋转角度、为度数，会转化为弧度;
 @return 处理后的图片
 
 例子:
 UIImage *newImage = [image hy_getNewImageWithScale:CGPointMake(0.5, 0.5) angle:90];
 
 */
- (UIImage *)hy_getNewImageWithScale:(CGPoint)scale angle:(CGFloat)angle;

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/**
 获取缩放和旋转后的新图片，这个方法针对原始图片的方向为UIImageOrientationUp有效

 @param scale 缩放因子；=1.0保持原有的大小；>1.0缩小；<1.0放大；
 @param orientation 屏幕旋转方法
 @return 处理后的新图片
 */
- (UIImage *)hy_getNewImageWithScale:(CGFloat)scale orientation:(UIImageOrientation)orientation;

#pragma mark - 图片缩放
/**
 获取缩放后的新图片，方向不变

 @param scale 缩放因子；=1.0保持原有的大小；>1.0缩小；<1.0放大；
 @return 处理后的新图片
 */
- (UIImage *)hy_getNewImageWithScale:(CGFloat)scale;

#pragma mark - 缩放图片
/**
 缩放图片
 
 @param size 缩放的范围
 @return 缩放后的图片
 */
- (UIImage *)hy_getScaledImageWithScaleToSize:(CGSize)size;

#pragma mark - 图片旋转
/**
 获取旋转后的新图片，缩放不变；这个方法针对原始图片的方向为UIImageOrientationUp有效
 
 @param orientation 旋转方向
 @return 处理后的新图片
 
 ps：旋转方向取值如下：
 UIImageOrientationUp,            // 默认
 UIImageOrientationDown,          // 旋转180度
 UIImageOrientationLeft,          // 逆时针旋转90度
 UIImageOrientationRight,         // 顺时针旋转90度
 UIImageOrientationUpMirrored,    // 图片的"从上到下方向"为轴进行翻转，即左右翻转
 UIImageOrientationDownMirrored,  // 图片的"从左到右方向"为轴进行翻转，即上下翻转
 UIImageOrientationLeftMirrored,  // 图片的"左上到右下方向"为轴进行翻转，即左对角线翻转
 UIImageOrientationRightMirrored, // 图片的"左下到右上方向"为轴进行翻转，即右对角线翻转
 
 */
- (UIImage *)hy_getNewImageWithOrientation:(UIImageOrientation)orientation;

#pragma mark - 图片镜像
/**
 左右镜像图片
 */
- (UIImage *)hy_leftRightMirroredImage;

/**
 上下镜像图片
 */
- (UIImage *)hy_topBottomMirroredImage;

/**
 左45度对角线镜像图片
 */
- (UIImage *)hy_leftDiagonal45MirroredImage;

/**
 右45度对角线镜像图片
 */
- (UIImage *)hy_rightDiagonal45MirroredImage;

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//--------------------------------------------------------------



#pragma mark - 图片裁剪 --- “圆形裁剪图片”使用“hy_getCircleImageDefault”和“hy_getCircleImageWithCenter”方法；“矩形裁剪图片”使用方法“hy_getNewImageWithCropFilter”；“自定义裁剪形状”使用方法“hy_getClippedImageWithPath”
/**
 把图片裁剪成"不带边框"的圆形图片，中心点为图片的中心点，半径为图片宽度和高度的最小值的一半
 */
- (UIImage *)hy_getCircleImageDefault;

/**
 把图片裁剪成“带有边框”的圆形图片，中心点为图片的中心点，半径为图片宽度和高度的最小值的一半

 @param borderWidth 边框的宽度
 @param borderColor 边框的颜色
 @return 裁剪后的图片
 */
- (UIImage *)hy_getCircleImageDefaultWithBorderWidth:(CGFloat)borderWidth borderColor:(nullable UIColor *)borderColor;

/**
 把图片裁剪成“不带边框”的圆形图片

 @param center 中心点
 @param radius 半径
 @return 裁剪后的图片
 */
- (UIImage *)hy_getCircleImageWithCenter:(CGPoint)center radius:(CGFloat)radius;

#pragma mark - 这个方法可能有异常，待修复！TODO !
/**
 把图片裁剪成“带有边框”的圆形图片

 @param center 中心点
 @param radius 半径
 @param borderWidth 边框的宽度
 @param borderColor 边框的颜色
 @return 裁剪后的图片
 */
- (UIImage *)hy_getCircleImageWithCenter:(CGPoint)center radius:(CGFloat)radius borderWidth:(CGFloat)borderWidth borderColor:(nullable UIColor *)borderColor;

/**
 裁剪图片

 @param path 裁剪的路径，形状
 @param borderWidth 线宽     ---  不需要时设置为0
 @param borderColor 线宽颜色  ---  不需要时设置为nil
 @return 裁剪后的图片
 */
- (UIImage *)hy_getClippedImageWithPath:(CGPathRef)path borderWidth:(CGFloat)borderWidth borderColor:(nullable UIColor *)borderColor;


#pragma mark - 给图片添加水印(文字水印和图片水印，或者二者混合的文字图片水印)
/**
 给图片添加“文字水印”

 @param rect 文字水印在图片上的位置
 @param text 水印文字内容
 @param dict 水印文字参数
 @return 添加水印后的图片
 */
- (UIImage *)hy_getTextStampImageAtRect:(CGRect)rect text:(NSString *)text dict:(NSDictionary *)dict;

/**
 给图片添加“图片水印” --- 注意，如果需要保持绘制的图片不失真，可以将rect参数中的宽度和高度设置为image的宽度和高度

 @param rect 图片水印在图片上的位置
 @param image 水印图片
 @return 添加水印后的图片
 */
- (UIImage *)hy_getImageStampImageAtRect:(CGRect)rect image:(UIImage *)image;


#pragma mark - 图片渲染
/**
 获取UIImageRenderingModeAlwaysOriginal模式的图片，即原来的图片，没有经过系统渲染过的；
 navigation bars, tab bars, toolbars, segmented controls 这些地方可能会用的到；
 
 */
- (UIImage *)hy_getOriginalImage;

@end

NS_ASSUME_NONNULL_END



