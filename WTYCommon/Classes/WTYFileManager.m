//
//  WTYFileManager.m
//  ProtoBufferDemo
//
//  Created by WTY on 2017/5/10.
//  Copyright © 2017年 WTY. All rights reserved.
//

#import "WTYFileManager.h"

@implementation WTYFileManager
static WTYFileManager *instance;
static NSFileManager *fileManager;

+(instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[WTYFileManager alloc] init];
        
    });
    return instance;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        fileManager = [NSFileManager defaultManager];
    }
    return self;
}


/*
 * fromPath: 文件或文件夹路径
 * toPath : 目的路经 如果是目录会如何
 */
-(void)moveFilePath:(NSString *)fromPath toPath:(NSString *)path {
    NSError *error;
    [fileManager moveItemAtPath:fromPath toPath:path error:&error];
    if (error) {
        NSLog(@"remove 失败%@",error);
    }
    else {
        NSLog(@"remove 成功");
    }
}

/*
 * filePath  文件或文件夹路径
 */
-(void)removeFilePath:(NSString *)filePath {
    
    NSError *error;
    [fileManager removeItemAtPath:filePath error:&error];
    if (error) {
        NSLog(@"remove 失败%@",error);
    }
    else {
        NSLog(@"remove 成功");
    }
}
/*
 *
 * fromPath : 源文件 或文件夹路径
 * toPath   : 目标 文件 路径
 */
-(void)copyFilePath:(NSString *)fromPath toPath:(NSString *)topath {
    
    NSError *error;
    [fileManager copyItemAtPath:fromPath toPath:topath error:&error];
    if (error) {
        NSLog(@"copy 失败%@",error);
    }
    else {
        NSLog(@"copy 成功");
    }
}

-(BOOL)creatFileWithPath:(NSString *)path content:(NSString *)content {
    
    BOOL isok= [fileManager createFileAtPath:path contents:[content dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
    if (isok) {
        NSLog(@"创建成功");
    }
    else {
        NSLog(@"创建失败");
    }
    return isok;
}
-(void)creatDirWithPath:(NSString *)path {
    NSError *error;

   [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
    if (error) {
        NSLog(@"copy 失败%@",error);
    }
    else {
        NSLog(@"copy 成功");
    }
}

//-(void)zipFileWithFromPath:(NSString *)fromPath toPath:(NSString *)toPath {
//    
//    BOOL isDir = NO;
//    BOOL exist = [fileManager fileExistsAtPath:fromPath isDirectory:&isDir];
//    if (!exist) {
//        return;
//    }
//    if (isDir) {
//        [SSZipArchive createZipFileAtPath:toPath withContentsOfDirectory:fromPath];
//    }
//    else {
//        [SSZipArchive createZipFileAtPath:toPath withFilesAtPaths:@[fromPath]];
//
//    }
//    
//}
//-(void)unzipFileWithFromPath:(NSString *)fromPath toPath:(NSString *)toPath {
//    
//    [SSZipArchive unzipFileAtPath:fromPath toDestination:toPath];
//}

@end
