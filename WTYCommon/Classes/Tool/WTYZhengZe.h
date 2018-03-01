//
//  WTYZhengZe.h
//  AFNetworking
//
//  Created by 王天佑 on 2018/3/1.
//

#import <Foundation/Foundation.h>

@interface WTYZhengZe : NSObject
-(id)init;
+(BOOL)isValidateEmail:(NSString *)email;
+(BOOL)checkTel:(NSString *)str;
+(BOOL)copySuffix:(NSString *)str;
+(BOOL)isValidateCode:(NSString *)code;
+ (BOOL)IsIdentityCard:(NSString *)IDCardNumber;
+ (BOOL)checkName:(NSString *)name;
+ (BOOL)checkImageUrl:(NSString *)imageUrl;
+ (BOOL)checkRecomandCode:(NSString *)code;
+ (BOOL)checkGoodsTotalVolume:(NSString *)code;


@end
