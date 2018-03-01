//
//  NSString+ZDCategoryString.m
//  zhongBao
//
//  Created by jiangqichen on 16/9/22.
//  Copyright © 2016年 jiangqichen. All rights reserved.
//

#import "NSString+ZDCategoryString.h"

@implementation NSString (ZDCategoryString)

//验证是否符合手机格式
- (BOOL)zd_verificationMobile
{
    if (self == nil) {
        return NO;
    } else if (self.length != 11) {
        return NO;
    }
    
    NSString *phoneRegex = @"^(13[0-9]|15[012356789]|17[0-9]|18[0-9]|14[57])[0-9]{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    
    return [phoneTest evaluateWithObject:self];
}

//验证是否符合邮件格式
- (BOOL)zd_verificationEmail
{
    if (self == nil) {
        return NO;
    }
    
    NSString *emailRegex = @"^\\w+((\\-\\w+)|(\\.\\w+))*@[A-Za-z0-9]+((\\.|\\-)[A-Za-z0-9]+)*.[A-Za-z0-9]+$";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:self];
}

//验证是否符合身份证格式
- (BOOL)zd_verificationCardId
{
    NSString *cardId = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([cardId length] != 18)
    {
        return NO;
    }
    NSString *mmdd = @"(((0[13578]|1[02])(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)(0[1-9]|[12][0-9]|30))|(02(0[1-9]|[1][0-9]|2[0-8])))";
    NSString *leapMmdd = @"0229";
    NSString *year = @"(19|20)[0-9]{2}";
    NSString *leapYear = @"(19|20)(0[48]|[2468][048]|[13579][26])";
    NSString *yearMmdd = [NSString stringWithFormat:@"%@%@", year, mmdd];
    NSString *leapyearMmdd = [NSString stringWithFormat:@"%@%@", leapYear, leapMmdd];
    NSString *yyyyMmdd = [NSString stringWithFormat:@"((%@)|(%@)|(%@))", yearMmdd, leapyearMmdd, @"20000229"];
    NSString *area = @"(1[1-5]|2[1-3]|3[1-7]|4[1-6]|5[0-4]|6[1-5]|82|[7-9]1)[0-9]{4}";
    NSString *cardIdRegex = [NSString stringWithFormat:@"%@%@%@", area, yyyyMmdd , @"[0-9]{3}[0-9Xx]"];
    NSPredicate *cardIdTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", cardIdRegex];
    
    return [cardIdTest evaluateWithObject:cardId];
}

/*
 * 获取字符串 高度
 * @param font 指定字体大小
 * @param width 限定的宽度
 */
//- (CGFloat)zd_stringHeightWithLineBreakMode:(NSLineBreakMode)lineBreakMode font:(UIFont *)font width:(CGFloat)width
//{
//    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
//    paragraphStyle.lineBreakMode = lineBreakMode;
//    NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
//    CGRect rect = [self boundingRectWithSize:CGSizeMake(width, 3000) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil];
//    return rect.size.height + 1;
//}

- (BOOL)judgeIdentityStringValid{
    if (self.length != 18) return NO;
    // 正则表达式判断基本 身份证号是否满足格式
    NSString *regex2 = @"^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$";
    NSPredicate *identityStringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    //如果通过该验证，说明身份证格式正确，但准确性还需计算
    if(![identityStringPredicate evaluateWithObject:self]) return NO;
    //** 开始进行校验 *//
    //将前17位加权因子保存在数组里
    NSArray *idCardWiArray = @[@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2"];
    //这是除以11后，可能产生的11位余数、验证码，也保存成数组
    NSArray *idCardYArray = @[@"1", @"0", @"10", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2"];
    //用来保存前17位各自乖以加权因子后的总和
    NSInteger idCardWiSum = 0;
    for(int i = 0;i < 17;i++) {
        NSInteger subStrIndex  = [[self substringWithRange:NSMakeRange(i, 1)] integerValue];
        NSInteger idCardWiIndex = [[idCardWiArray objectAtIndex:i] integerValue];
        idCardWiSum      += subStrIndex * idCardWiIndex;
    }
    //计算出校验码所在数组的位置
    NSInteger idCardMod=idCardWiSum%11;
    //得到最后一位身份证号码
    NSString *idCardLast= [self substringWithRange:NSMakeRange(17, 1)];
    //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
    if(idCardMod==2) {
        if(![idCardLast isEqualToString:@"X"]||[idCardLast isEqualToString:@"x"]) {
            return NO;
        }
    }else{
        //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
        if(![idCardLast isEqualToString: [idCardYArray objectAtIndex:idCardMod]]) {
            return NO;
        }
    }
    return YES;
}

/*
 * 获取字符串 宽度
 * @param font 指定字体大小
 * @param height 限定的高度
 */
//- (CGFloat)zd_stringWidthWithLineBreakMode:(NSLineBreakMode)lineBreakMode font:(UIFont *)font height:(CGFloat)height
//{
//    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
//    paragraphStyle.lineBreakMode = lineBreakMode;
//    NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
//    CGRect rect = [self boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
//    return rect.size.width + 1;
//}

- (NSString *)zd_stringTotimeFormatter123{

    NSTimeInterval _interval=[self doubleValue] / 1000.0;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:_interval];
    NSDateFormatter *objDateformat = [[NSDateFormatter alloc] init];
    [objDateformat setDateFormat:@"yyyy-MM-dd"];
    return [objDateformat stringFromDate: date];

}
- (BOOL)isNoEmpty{
    
    if (!self) {
        return NO;
    } else {
        //A character set containing only the whitespace characters space (U+0020) and tab (U+0009) and the newline and nextline characters (U+000A–U+000D, U+0085).
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        
        //Returns a new string made by removing from both ends of the receiver characters contained in a given character set.
        NSString *trimedString = [self stringByTrimmingCharactersInSet:set];
        
        if ([trimedString length] == 0) {
            return NO;
        } else {
            return YES;
        }
    }
}
@end
