//
//  FileManager.h
//  Cachedemo
//
//  Created by mangues on 15/12/25.
//  Copyright © 2015年 mangues. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MgDefine.h"


@interface FileManager : NSObject
// 获取应用沙盒根路径
+ (void)dirHome;

//获取Documents目录
+ (NSString *)dirDoc;
//获取Library目录
+ (void)dirLib;

//获取Cache目录
+(NSString*)dirCache;
+ (void)dirTmp;

//创建文件夹
+(NSString*)createDir:(NSString*)dir;

//创建文件
+(NSString*)createFile:(NSString*)fileDir;
//写文件
+(BOOL)writeFile:(NSString*) fileDir fileContent:(NSString*)fileContent;

//读文件
+ (NSString*)readFile:(NSString*)fileDir;


//文件属性
+ (NSDictionary*)fileAttriutes:(NSString*)fileDir;

//删除文件
+ (BOOL)deleteFile:(NSString*)fileDir;

+ (NSArray *) getAllFileNames:(NSString *)dirName;
+ (BOOL)isExist:(NSString*)fileDir;
@end
