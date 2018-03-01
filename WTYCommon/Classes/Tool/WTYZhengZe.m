//
//  WTYZhengZe.m
//  AFNetworking
//
//  Created by 王天佑 on 2018/3/1.
//

#import "WTYZhengZe.h"

@implementation WTYZhengZe

-(id)init
{
    if(self=[super init])
    {
        
    }
    return self;
}

+(BOOL)isValidateEmail:(NSString *)email {
    
    
    
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:email];
    
    
}
+(BOOL)isValidateCode:(NSString *)str {
    
    NSString *regex = @"^[0-9]\\d*$";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    BOOL isok = [pred evaluateWithObject:str];
    
    return isok;
    
}

+ (BOOL)checkTel:(NSString *)str
{
    
    NSString *regex = @"^1[3-9]\\d{9}$";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:str];
}

+ (BOOL)copySuffix:(NSString *)str
{
    // (12)
    
    NSString *regex = @"^\\([1-9]{0,}[1-9]\\)$";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:str];
    
}
+ (BOOL) IsIdentityCard:(NSString *)IDCardNumber
{
    //    if (IDCardNumber.length <= 0) {
    //        return NO;
    //    }
    //    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    //    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    //    return [identityCardPredicate evaluateWithObject:IDCardNumber];
    return [self validateIDCardNumber:IDCardNumber];
}

+ (BOOL)validateIDCardNumber:(NSString *)userID
{
    
    //长度不为18的都排除掉
    if (userID.length!=18) {
        return NO;
    }
    
    //校验格式
    NSString *regex2 = @"^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    BOOL flag = [identityCardPredicate evaluateWithObject:userID];
    
    if (!flag) {
        return flag;  //格式错误
    }else {
        //格式正确在判断是否合法
        //将前17位加权因子保存在数组里
        NSArray * idCardWiArray = @[@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2"];
        
        //这是除以11后，可能产生的11位余数、验证码，也保存成数组
        NSArray * idCardYArray = @[@"1", @"0", @"10", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2"];
        
        //用来保存前17位各自乖以加权因子后的总和
        NSInteger idCardWiSum = 0;
        for(int i = 0;i < 17;i++){
            NSInteger subStrIndex = [[userID substringWithRange:NSMakeRange(i, 1)] integerValue];
            NSInteger idCardWiIndex = [[idCardWiArray objectAtIndex:i] integerValue];
            idCardWiSum+= subStrIndex * idCardWiIndex;
        }
        
        //计算出校验码所在数组的位置
        NSInteger idCardMod=idCardWiSum%11;
        
        //得到最后一位身份证号码
        NSString * idCardLast= [userID substringWithRange:NSMakeRange(17, 1)];
        
        //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
        if(idCardMod==2){
            if([idCardLast isEqualToString:@"X"]||[idCardLast isEqualToString:@"x"]){
                return YES;
            }else{
                return NO;
            }
        }else{
            //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
            if([idCardLast isEqualToString: [idCardYArray objectAtIndex:idCardMod]]){
                return YES;
            }else{
                return NO;
            }
        }
    }
}

+ (BOOL)checkName:(NSString *)name {
    if (name.length > 0 && name.length < 20) {
        return YES;
    }
    else {
        return NO;
    }
}
+ (BOOL)checkImageUrl:(NSString *)imageUrl {
    if (imageUrl.length > 0) {
        return YES;
    }
    else {
        return NO;
    }
    
}
+ (BOOL)checkRecomandCode:(NSString *)code {
    
    return YES;
    
    //    if (code.length == 0) {
    //        return YES;
    //    }
    //    NSString *regex = @"^[0-9]\\d*$";
    //
    //    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    //
    //    BOOL isok = [pred evaluateWithObject:code];
    //
    //    return isok;
}
+ (BOOL)checkGoodsTotalVolume:(NSString *)code {
    
    NSString *regexInt = @"^[1-9]\\d*$";
    NSString *regexFloat = @"^[1-9]\\d*\\.\\d*|0\\.\\d*[1-9]\\d*$";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexInt];
    
    BOOL isok = [pred evaluateWithObject:code];
    if (isok) {
        return YES;
    }
    
    NSPredicate *predF = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexFloat];
    
    isok = [predF evaluateWithObject:code];
    if (isok) {
        return YES;
    }
    
    return NO;
}

+(BOOL)allTel:(NSString *)tel {
    
    BOOL isok = [self checkTel:tel];
    if (isok) {
        return YES;
    }
    
    return YES;
}
@end
