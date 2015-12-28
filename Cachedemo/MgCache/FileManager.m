//
//  FileManager.m
//  Cachedemo
//
//  Created by mangues on 15/12/25.
//  Copyright © 2015年 mangues. All rights reserved.
//

#import "FileManager.h"

@implementation FileManager
// 获取应用沙盒根路径
+(void)dirHome{
    NSString *dirHome=NSHomeDirectory();
    DLog(@"app_home: %@",dirHome);
}

//获取Documents目录
+(NSString *)dirDoc{
    //[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    DLog(@"app_home_doc: %@",documentsDirectory);
    return documentsDirectory;
}
//获取Library目录
+(void)dirLib{
    //[NSHomeDirectory() stringByAppendingPathComponent:@"Library"];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *libraryDirectory = [paths objectAtIndex:0];
    DLog(@"app_home_lib: %@",libraryDirectory);
}

//获取Cache目录
+(NSString*)dirCache{
    NSArray *cacPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [cacPath objectAtIndex:0];
    DLog(@"app_home_lib_cache: %@",cachePath);
    return cachePath;
}
+(void)dirTmp{
    //[NSHomeDirectory() stringByAppendingPathComponent:@"tmp"];
    NSString *tmpDirectory = NSTemporaryDirectory();
    DLog(@"app_home_tmp: %@",tmpDirectory);
}

//创建文件夹
+(NSString*)createDir:(NSString*)dir{
    NSString *documentsPath =[FileManager dirCache];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *testDirectory = [documentsPath stringByAppendingPathComponent:dir];
    // 创建目录
    BOOL res=[fileManager createDirectoryAtPath:testDirectory withIntermediateDirectories:YES attributes:nil error:nil];
    if (res) {
        DLog(@"文件夹创建成功");
        return testDirectory;
    }else{
         DLog(@"文件夹创建失败");
        return nil;
    }
}

//创建文件
+(NSString*)createFile:(NSString*)fileDir{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL res=[fileManager createFileAtPath:fileDir contents:nil attributes:nil];
    if (res) {
        DLog(@"文件创建成功: %@" ,fileDir);
        return fileDir;
    }else{
        DLog(@"文件创建失败");
        return nil;
    }
}
//写文件
+(BOOL)writeFile:(NSString*) fileDir fileContent:(NSString*)fileContent{
    BOOL res=[fileContent writeToFile:fileDir atomically:YES encoding:NSUTF8StringEncoding error:nil];
    if (res) {
        DLog(@"文件写入成功");
        return YES;
    }else{
        DLog(@"文件写入失败");
        return NO;
    }
}

//读文件
+ (NSString*)readFile:(NSString*)fileDir{
    //    NSData *data = [NSData dataWithContentsOfFile:testPath];
    //    DLog(@"文件读取成功: %@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    NSString *content=[NSString stringWithContentsOfFile:fileDir encoding:NSUTF8StringEncoding error:nil];
    DLog(@"文件读取成功: %@",content);
    return content;
}


//文件属性
+ (void)fileAttriutes{
    NSString *documentsPath =[FileManager dirDoc];
    NSString *testDirectory = [documentsPath stringByAppendingPathComponent:@"test"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *testPath = [testDirectory stringByAppendingPathComponent:@"test.txt"];
    NSDictionary *fileAttributes = [fileManager attributesOfItemAtPath:testPath error:nil];
    NSArray *keys;
    id key, value;
    keys = [fileAttributes allKeys];
    int count = [keys count];
    for (int i = 0; i < count; i++)
    {
        key = [keys objectAtIndex: i];
        value = [fileAttributes objectForKey: key];
        DLog (@"Key: %@ for value: %@", key, value);
    }
}

//删除文件
+ (BOOL)deleteFile:(NSString*)fileDir{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL res=[fileManager removeItemAtPath:fileDir error:nil];
    if (res) {
        DLog(@"文件删除成功");
    }else
        DLog(@"文件删除失败");
    DLog(@"文件是否存在: %@",[fileManager isExecutableFileAtPath:fileDir]?@"YES":@"NO");
    return res;
}


+ (NSArray *) getAllFileNames:(NSString *)dirName
{
    NSArray *files = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:dirName error:nil];
    return files;
}

@end
