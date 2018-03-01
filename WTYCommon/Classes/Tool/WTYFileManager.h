//
//  WTYFileManager.h
//  ProtoBufferDemo
//
//  Created by WTY on 2017/5/10.
//  Copyright © 2017年 WTY. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "SSZipArchive/ZipArchive.h"
@interface WTYFileManager : NSObject
+(instancetype)shareInstance;
-(void)moveFilePath:(NSString *)fromPath toPath:(NSString *)path;
-(void)removeFilePath:(NSString *)filePath;
-(void)copyFilePath:(NSString *)fromPath toPath:(NSString *)topath;
-(BOOL)creatFileWithPath:(NSString *)path content:(NSString *)content;
-(void)creatDirWithPath:(NSString *)path;
//-(void)zipFileWithFromPath:(NSString *)fromPath toPath:(NSString *)toPath;
//-(void)unzipFileWithFromPath:(NSString *)fromPath toPath:(NSString *)toPath;
@end
