//
//  UIView+HYCategory.h
//  Category
//
//  Created by wuhaiyang on 16/8/24.
//  Copyright © 2016年 wuhaiyang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (HYCategory)

#pragma mark - 快速 set 和 get 方法
@property (nonatomic) CGFloat hy_top;         // self.frame.origin.y
@property (nonatomic) CGFloat hy_left;        // self.frame.origin.x
@property (nonatomic) CGFloat hy_bottom;      // self.frame.origin.y + self.frame.size.height
@property (nonatomic) CGFloat hy_right;       // self.frame.origin.x + self.frame.size.width
@property (nonatomic) CGFloat hy_width;       // self.frame.size.width
@property (nonatomic) CGFloat hy_height;      // self.frame.size.height
@property (nonatomic) CGFloat hy_centerX;     // self.center.x
@property (nonatomic) CGFloat hy_centerY;     // self.center.y
@property (nonatomic) CGPoint hy_origin;      // self.frame.origin
@property (nonatomic) CGSize  hy_size;        // self.frame.size

#pragma mark - 截屏
/**
 截屏，获取整个屏幕内容
 哪个view需要截屏，哪个view调用此方法，UIWindow也是继承与UIView的，也可以调用这个方法
 
 @return 图片
 */
- (UIImage *)hy_screenCapture;

/**
 截屏，获取屏幕上给定范围的内容
 哪个view需要截屏，哪个view调用此方法，

 @param area 范围大小
 @return 图片
 */
- (UIImage *)hy_screenCaptureAtArea:(CGSize)area;

@end

NS_ASSUME_NONNULL_END
