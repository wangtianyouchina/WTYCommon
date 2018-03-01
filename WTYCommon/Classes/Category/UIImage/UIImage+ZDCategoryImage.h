//
//  UIImage+ZDCategoryImage.h
//  zhongBao
//
//  Created by jiangqichen on 16/9/28.
//  Copyright © 2016年 jiangqichen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ZDCategoryImage)

//获取纯色图片
+ (UIImage *)zd_imageWithSolidColor:(UIColor *)color imageSize:(CGSize)size;

//旋转图片成为正常状态
- (UIImage *)zd_fixOrientation;

//转换成CVPixelBufferRef
- (CVPixelBufferRef)zd_pixelBuffer;

@end
