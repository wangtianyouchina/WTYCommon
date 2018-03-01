//
//  UIColor+ZDCategoryColor.m
//  zhongBao
//
//  Created by jiangqichen on 16/9/22.
//  Copyright © 2016年 jiangqichen. All rights reserved.
//

#import "UIColor+ZDCategoryColor.h"

@implementation UIColor (ZDCategoryColor)

/*
 * 通过16进制计算颜色
 * @param inColorString 十六进制字符串 eg: @"FFFFFF"
 * @param alpha 透明度
 */
+ (UIColor *)zd_colorFormHexRGB:(NSString *)inColorString
{
    return [self zd_colorFormHexRGB:inColorString alpha:1.0];
}

+ (UIColor *)zd_colorFormHexRGB:(NSString *)inColorString alpha:(CGFloat)alpha
{
    UIColor *result = nil;
    unsigned int colorCode = 0;
    unsigned char redByte, greenByte, blueByte;
    
    if (nil != inColorString) {
        NSScanner *scanner = [NSScanner scannerWithString:inColorString];
        (void) [scanner scanHexInt:&colorCode]; // ignore error
    }
    
    redByte = (unsigned char) (colorCode >> 16);
    greenByte = (unsigned char) (colorCode >> 8);
    blueByte = (unsigned char) (colorCode); // masks off high bits
    result = [UIColor
              colorWithRed: (float)redByte / 0xff
              green: (float)greenByte/ 0xff
              blue: (float)blueByte / 0xff
              alpha:alpha];
    
    return result;
}

/*
 * RGB相等颜色
 * @param rgb rgb值 0~255
 * @param alpha 透明度
 */
+ (UIColor *)zd_colorWithEqualRGB:(CGFloat)rgb
{
    return [self zd_colorWithRed:rgb green:rgb blue:rgb alpha:1.0];
}

+ (UIColor *)zd_colorWithEqualRGB:(CGFloat)rgb alpha:(CGFloat)alpha
{
    return [self zd_colorWithRed:rgb green:rgb blue:rgb alpha:alpha];
}

/*
 * RGB颜色
 * @param rgb rgb值 0~255
 * @param alpha 透明度
 */
+ (UIColor *)zd_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;
{
    return [self zd_colorWithRed:red green:green blue:blue alpha:1.0];
}

+ (UIColor *)zd_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}

//灰色线
+ (UIColor *)zd_lineColor
{
    return [self zd_colorWithRed:224.0 green:224.0 blue:224.0 alpha:1.0];
}

//黑色字
+ (UIColor *)zd_textColor
{
    return [self zd_colorWithRed:51.0 green:51.0 blue:51.0 alpha:1.0];
}

//灰色边框颜色
+ (UIColor *)zd_borderLineColor
{
    return [self zd_colorWithRed:217.0 green:217.0 blue:217.0 alpha:1.0];
}


// 主体颜色
+ (UIColor *)zd_specialColor
{
//    return [self zd_colorWithRed:44.0 green:144.0 blue:238.0];
    return  [self zd_colorFormHexRGB:@"29a1f7" alpha:1];
}

+ (UIColor *)zd_separateColor{

    return [self zd_colorFormHexRGB:@"DCDCDC" alpha:1.0];
}

@end
