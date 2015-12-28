//
//  FileManager.h
//  Cachedemo
//
//  Created by mangues on 15/12/25.
//  Copyright © 2015年 mangues. All rights reserved.
//

#import <UIKit/UIKit.h>
//有返回值
#define SAFE_OBJECT_OF_ARRAY_AT_INDEX(_ARRAY_,_INDEX_) ((_ARRAY_)&&(_INDEX_>=0)&&(_INDEX_<[_ARRAY_ count])?([_ARRAY_ objectAtIndex:_INDEX_]):(nil))

//解决截取字符串的问题
#define SAFE_SUBSTRING_TO_INDEX(_STR_,_INX_) ((_INX_ <= [_STR_ length])? ([_STR_ substringToIndex:_INX_]):(nil))

//解决将空值加入数组造造成的崩溃

#define SAFE_ADD_OBJECT_INTO_ARRAY(_ARRAY_,_OBJ_) ((_OBJ_)? ([_ARRAY_ addObject:_OBJ_]) : (nil))

#define DLog(...) NSLog(@"%s %@", __PRETTY_FUNCTION__, [NSString stringWithFormat:__VA_ARGS__])


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
+ (void)fileAttriutes;

//删除文件
+ (BOOL)deleteFile:(NSString*)fileDir;

+ (NSArray *) getAllFileNames:(NSString *)dirName;
@end
