//
//  MgCache.m
//  Cachedemo
//
//  Created by mangues on 15/12/25.
//  Copyright © 2015年 mangues. All rights reserved.
//

#import "MgCache.h"
#import "FileManager.h"
#import "MgUtil.h"

@implementation MgCache
NSMutableDictionary* mgCacheMap;

+ (MgCache *)sharedMgCache:(NSString*)cacheDir{
      MgCache *sharedMgCacheInstance = nil;
//    static dispatch_once_t predicate;
//    dispatch_once(&predicate, ^{
//        sharedMgCacheInstance = [[self alloc] init];
//        
//    });
    sharedMgCacheInstance = [[MgCache alloc] init:cacheDir];
    return sharedMgCacheInstance;
}
//初始化
- (id)init:(NSString*)cacheDir{
    if(self = [super init]){
        self.mCache = [[MgCacheManager alloc] init:cacheDir];
    }
    return self;
}


+ (MgCache*)getMgCache{
    return [MgCache getMgCache:@"MgCache"];
}

+ (MgCache*)getMgCache:(NSString*)cacheName{
    NSString * cacheDir = [FileManager createDir:cacheName]; //缓存目录
    if (cacheDir==nil) {
        return nil;
    }
    if (mgCacheMap==nil) {
       mgCacheMap = [[NSMutableDictionary alloc] init];
    }
    MgCache *manager = [mgCacheMap valueForKey:cacheDir]; //缓存目录为key
    if (manager==nil) {
        manager =[MgCache sharedMgCache:cacheDir];
        [mgCacheMap setObject:manager forKey:cacheDir];
    }
    return manager;
}
//存入数据
- (void)putValue:(NSString*)value forKey:(NSString*)key{
    NSString* fileDir = [_mCache newFile:key andValue:value];   //创建文件
    [FileManager writeFile:fileDir fileContent:value];
}


//存入数据,带时间,秒
- (void)putValue:(NSString*)value forKey:(NSString*)key saveTime:(int) saveTime{
    NSString* fileDir = [_mCache newFile:key andValue:value];   //创建文件
    NSString* fileWithDate = [MgUtil newStringWithDateInfo:saveTime content:value];
    [FileManager writeFile:fileDir fileContent:fileWithDate];
}


//获取数据
- (NSString*)getAsString:(NSString*)key{
    NSString* fileDir = [_mCache getFileDir:key];
    BOOL removeFile = NO;
    NSString* valueContent = [FileManager readFile:fileDir];
    if (![MgUtil isDue:valueContent]) {
        return [MgUtil clearDateInfo:valueContent];
    }else {
        removeFile = YES;
        [_mCache removeFile:fileDir];
        return nil;
    }
}


- (BOOL)isSame:(NSString*)value forKey:(NSString*)key{
    return [_mCache isSame:value forKey:key];
}
@end
