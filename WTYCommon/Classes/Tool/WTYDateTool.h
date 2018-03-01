//
//  WTYDateTool.h
//  ProtoBufferDemo
//
//  Created by WTY on 2017/5/12.
//  Copyright © 2017年 WTY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WTYDateTool : NSObject
/**
 *  得到单例
 *T
 *  @return 单例的对象
 */
+ (id)shareInstance;

/**
 返回时间 格式化后的

 @return <#return value description#>
 */
-(NSString *)dateNowWithFormat:(NSString *)format;
// 时间戳转字符串
-(NSString *)stringWithDateNumber:(long)nubmer format:(NSString *)format;

/**
 *  得到当前时区的时间，一般为北京时间
 *
 *  @return NSDate对象
 */
- (NSDate *)dateNow;


/**
 *  获取自1970年到现在的秒数
 *
 *  @return 秒数
 */
- (NSInteger)currentSecond;


/**
 *  获取自1970年到现在的毫秒数
 *
 *  @return 毫秒数
 */
- (long long)currentMsec;


/**
 *  获取当前的日期对象
 *
 *  @return 日期对象
 */
- (NSDateComponents *)currentDateCompoent;


/**
 *  通过给定的NSDate得到日期对象
 *
 *  @param date NSDate
 *
 *  @return 日期对象
 */
- (NSDateComponents *)dateCompoentFromDate:(NSDate *)date;


/**
 *  获取某年某月最大天数
 *
 *  @param year  年份
 *  @param month 月份
 *
 *  @return 天数
 */
- (NSInteger)maxDayForYear:(NSInteger *)year month:(NSInteger)month;


/**
 *  通过制定的参数获取NSDate对象
 *
 *  @param year   年
 *  @param month  月
 *  @param day    日
 *  @param hour   时
 *  @param minute 分
 *  @param second 秒
 *
 *  @return NSDate对象
 */
- (NSDate *)dateFromYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second;


/**
 *  通过components获取NSDate对象
 *
 *  @param components  NSDateComponents类型
 *
 *  @return NSDate对象
 */
- (NSDate *)dateFromComponents:(NSDateComponents *)components;


/**
 *  通过秒数来获取时间字符串
 *
 *  @param second 自1970年开始的秒数
 *
 *  @return 时间字符串
 */
- (NSString *)dateStringFromSecond:(NSInteger)second;


/**
 *  得到date之后或之前的日子，正表示之后，负表示之前
 *
 *  @param date  基准时间
 *  @param year  年
 *  @param month 月
 *  @param day   日
 *
 *  @return 计算之后的日期
 */
- (NSDate *)dateAfterFromDate:(NSDate *)date withYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;


/**
 *  计算两个日期差几天
 *
 *  @param date1 日期1
 *  @param date2 日期2
 *
 *  @return 差的天数
 */
- (NSInteger)differenceFromDate:(NSDate *)date1 toDate:(NSDate *)date2;


/**
 *  格式化现在时间与给定的秒数的时间差
 *
 *  @param second 自1970年开始的秒数
 *
 *  @return 格式化后的字符串
 */
- (NSString *)formatDifferenceToNowFromSecond:(NSInteger)second;

@end
