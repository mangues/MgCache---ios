//
//  MgCacheManager.m
//  Cachedemo
//
//  Created by mangues on 15/12/25.
//  Copyright © 2015年 mangues. All rights reserved.
//

#import "MgCacheManager.h"
#import "NSString+MD5Encrypt.h"
#import "FileManager.h"
@interface MgCacheManager(){
    NSString* cacheDir;
}
@end
@implementation MgCacheManager
- (id)init:(NSString *)cacheDirString{
    if (self = [super init]) {
        self->cacheDir = cacheDirString;
    }
    return self;
}
//新建缓存文件
- (NSString*)newFile:(NSString*)key andValue:(NSString*)value;{
    NSString *md5Content = [value md5Encrypt];
    NSString *fileDir = [self getFileDir:key];
    if (![fileDir isEqualToString:cacheDir]) {   //没有文件
         [FileManager deleteFile:fileDir];
    }
    NSString *fileName = [NSString stringWithFormat:@"%@_%@",key,md5Content];
    fileDir = [cacheDir stringByAppendingPathComponent:fileName];
    fileDir = [FileManager createFile:fileDir];
    return fileDir;
}


//获取文件路径
- (NSString*)getFileDir:(NSString*)key {
   __block NSString *fileName = @"";
    NSArray *arrayFile = [FileManager getAllFileNames:cacheDir];
    [arrayFile enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSArray *array_first = [obj componentsSeparatedByString:@"_"];
        NSString *first_string = array_first[0];
        if ([key isEqualToString:first_string]) {
            fileName = obj;
        }
    }];
     NSString *fileDir = [cacheDir stringByAppendingPathComponent:fileName];
     return fileDir;
}


//删除文件
- (BOOL)removeFile:(NSString*)fileDir{
    return [FileManager deleteFile:fileDir];
}

@end
