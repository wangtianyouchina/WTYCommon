//
//  WKPathManager.h
//  LuWeiKeiOS
//
//  Created by WTY on 2017/5/8.
//  Copyright © 2017年 wang.tianyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WTYPathManager : NSObject
+(instancetype)shareInstance;
-(NSString *)cityModelsDBpath;
@end
