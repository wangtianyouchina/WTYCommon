//
//  NSString+ZDCategoryString.h
//  zhongBao
//
//  Created by jiangqichen on 16/9/22.
//  Copyright © 2016年 jiangqichen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZDCategoryString)

//验证是否符合手机格式
- (BOOL)zd_verificationMobile;

//验证是否符合邮件格式
- (BOOL)zd_verificationEmail;

//验证是否符合身份证格式
- (BOOL)zd_verificationCardId;


- (BOOL)judgeIdentityStringValid;
/*
 * 获取字符串 高度
 * @param font 指定字体大小
 * @param width 限定的宽度
 */
//- (CGFloat)zd_stringHeightWithLineBreakMode:(NSLineBreakMode)lineBreakMode font:(UIFont *)font width:(CGFloat)width;


/*
 * 获取字符串 宽度
 * @param font 指定字体大小
 * @param height 限定的高度
 */
//- (CGFloat)zd_stringWidthWithLineBreakMode:(NSLineBreakMode)lineBreakMode font:(UIFont *)font height:(CGFloat)height;

// 字符串(时间戳)转标准时间
- (NSString *)zd_stringTotimeFormatter123;

// 判断字符串是否为空或者只有空格
- (BOOL)isNoEmpty;
@end
