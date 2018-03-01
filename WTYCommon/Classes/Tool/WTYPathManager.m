//
//  WKPathManager.m
//  LuWeiKeiOS
//
//  Created by WTY on 2017/5/8.
//  Copyright © 2017年 wang.tianyou. All rights reserved.
//

#import "WTYPathManager.h"
NSString* WKPathOfApplicationSupport()
{
    return [NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES) firstObject];
}

NSString* WKDataRootDirectory()
{
    static NSString* res=nil;
    if (!res) {
        res=[WKPathOfApplicationSupport() stringByAppendingPathComponent:@"com.zhidian.client"];
        NSFileManager* fm=[NSFileManager defaultManager];
        BOOL isDir=NO;
        if (![fm fileExistsAtPath:res isDirectory:&isDir] || !isDir) {
            [fm createDirectoryAtPath:res withIntermediateDirectories:YES attributes:nil error:NULL];
        }
    }
    return res;
}


static WTYPathManager *manager;
@interface WTYPathManager ()
@property(nonatomic,copy) NSString *zhiDiDBDir;
@end
@implementation WTYPathManager
+(instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[WTYPathManager alloc] init];
    });
    return manager;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSFileManager* fm=[NSFileManager defaultManager];
        BOOL isDir;
        self.zhiDiDBDir=[WKDataRootDirectory() stringByAppendingPathComponent:@"DB"];
        if (![fm fileExistsAtPath:self.zhiDiDBDir isDirectory:&isDir] || !isDir) {
            [fm createDirectoryAtPath:self.zhiDiDBDir withIntermediateDirectories:YES attributes:nil error:NULL];
        }

    }
    return self;
}


-(NSString *)cityModelsDBpath {
    
    return [NSString stringWithFormat:@"%@/%@",[WTYPathManager shareInstance].zhiDiDBDir,@"city_model.db"];

}




@end
