//
//  UIColor+ZDCategoryColor.h
//  zhongBao
//
//  Created by jiangqichen on 16/9/22.
//  Copyright © 2016年 jiangqichen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ZDCategoryColor)

/*
 * 通过16进制计算颜色
 * @param inColorString 十六进制字符串 eg: @"FFFFFF"
 * @param alpha 透明度
 */
+ (UIColor *)zd_colorFormHexRGB:(NSString *)inColorString;
+ (UIColor *)zd_colorFormHexRGB:(NSString *)inColorString alpha:(CGFloat)alpha;

/*
 * RGB相等颜色
 * @param rgb rgb值 0~255
 * @param alpha 透明度
 */
+ (UIColor *)zd_colorWithEqualRGB:(CGFloat)rgb;
+ (UIColor *)zd_colorWithEqualRGB:(CGFloat)rgb alpha:(CGFloat)alpha;

/*
 * RGB颜色
 * @param rgb rgb值 0~255
 * @param alpha 透明度
 */
+ (UIColor *)zd_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;
+ (UIColor *)zd_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

//灰色线
+ (UIColor *)zd_lineColor;

//黑色字
+ (UIColor *)zd_textColor;

//灰色边框颜色
+ (UIColor *)zd_borderLineColor;

//app特定颜色
+ (UIColor *)zd_specialColor;

//分割线颜色
+ (UIColor *)zd_separateColor;

@end
