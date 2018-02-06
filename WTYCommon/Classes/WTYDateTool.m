//
//  WTYDateTool.m
//  ProtoBufferDemo
//
//  Created by WTY on 2017/5/12.
//  Copyright © 2017年 WTY. All rights reserved.
//

#import "WTYDateTool.h"
// 新天际啊

@implementation WTYDateTool
+ (id)shareInstance {
    //单例模式
    static WTYDateTool *singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [[WTYDateTool alloc] init];
    });
    
    return singleton;
}
-(NSString *)dateNowWithFormat:(NSString *)format {
    
    NSDate *date = [NSDate date];
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:format];
    return [dateFormat stringFromDate:date];
}
-(NSString *)stringWithDateNumber:(long)nubmer format:(NSString *)format {
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:nubmer];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    
    return [formatter stringFromDate:date];
}
- (NSDate *)dateNow {
    //获取当前时区的当前时间
    NSDate *date = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:date];
    NSDate *localeDate = [date dateByAddingTimeInterval:interval];
    return localeDate;
}

- (NSInteger)currentSecond {
    NSDate *now = [NSDate date];
    
    return [now timeIntervalSince1970];
}

- (long long)currentMsec {
    NSDate *now = [NSDate date];
    
    //秒数乘以1000
    return [now timeIntervalSince1970] * 1000;
}

- (NSDateComponents *)currentDateCompoent {
    NSDate *now = [NSDate date];
    
    return [self dateCompoentFromDate:now];
}

- (NSDateComponents *)dateCompoentFromDate:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    return [calendar components:unitFlags fromDate:date];
}

- (NSInteger)maxDayForYear:(NSInteger *)year month:(NSInteger)month {
    NSString *date = [NSString stringWithFormat:@"%04ld-%02ld-01", (long)year, (long)month];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *today = [formatter dateFromString:date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSRange days = [calendar rangeOfUnit:NSCalendarUnitDay
                                  inUnit:NSCalendarUnitMonth
                                 forDate:today];
    
    return days.length;
}

- (NSDate *)dateFromYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second {
    NSDateComponents* components = [[NSDateComponents alloc] init];
    [components setYear:year];
    [components setMonth:month];
    [components setDay:day];
    [components setHour:hour];
    [components setMinute:minute];
    [components setSecond:second];
    NSCalendar* calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    return [calendar dateFromComponents:components];
}

- (NSDate *)dateFromComponents:(NSDateComponents *)components {
    NSCalendar* calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    return [calendar dateFromComponents:components];
}


- (NSString *)dateStringFromSecond:(NSInteger)second {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:second];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:MM:ss"];
    
    return [formatter stringFromDate:date];
}


- (NSDate *)dateAfterFromDate:(NSDate *)date withYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day {
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setYear:year];
    [comps setMonth:month];
    [comps setDay:day];
    NSCalendar *calender = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *mDate = [calender dateByAddingComponents:comps toDate:date options:0];
    return mDate;
}

- (NSInteger)differenceFromDate:(NSDate *)date1 toDate:(NSDate *)date2 {
    NSTimeInterval time = [date2 timeIntervalSinceDate:date1];
    NSInteger days = time / (3600 * 24);
    
    return days;
}

- (NSString *)formatDifferenceToNowFromSecond:(NSInteger)second {
    NSInteger nowSecond = [self currentSecond];
    NSInteger diff = nowSecond - second;
    if (diff < 60) { //几秒前
        return [NSString stringWithFormat:@"%ld秒前", (long)diff];
    }
    if (diff >= 60 && diff < 3600) { //几分钟前
        return [NSString stringWithFormat:@"%ld分钟前", diff/60];
    }
    if (diff >= 3600 && diff < 3600 * 24) { //几小时前
        return [NSString stringWithFormat:@"%ld小时前", diff/3600];
    }
    //几天前
    return [NSString stringWithFormat:@"%ld天前", diff/(3600*24)];
}
@end
