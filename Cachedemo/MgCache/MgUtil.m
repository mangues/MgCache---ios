//
//  MgUtil.m
//  Cachedemo
//
//  Created by mangues on 15/12/28.
//  Copyright © 2015年 mangues. All rights reserved.
//

#import "MgUtil.h"

@implementation MgUtil
NSString*  mSeparator = @"~~--~~oo~~--~~oo~~--~~oo~~--~~";
+ (NSString*)newStringWithDateInfo:(int)saveTime content:(NSString*)value{
    NSString* fileWithDate =[MgUtil createDateInfo:saveTime];
    return  [NSString stringWithFormat:@"%@%@",fileWithDate,value];
}

+ (NSString*)createDateInfo:(int)second{
    NSTimeInterval time=[[NSDate date] timeIntervalSince1970]*1000;
    NSString *currentTime = [NSString stringWithFormat:@"%f",time];
    while (currentTime.length < 13) {
        currentTime = [NSString stringWithFormat:@"0%@",currentTime];
    }
    return [NSString stringWithFormat:@"%@%@%d%@",currentTime,mSeparator,second,mSeparator];
}
//判断缓存的String是否到期
+ (BOOL)isDue:(NSString*)str{
    NSArray* array = [MgUtil getDateInfoFromDate:str];
    if (array!=nil&&array.count >=2) {
        NSString * saveTimeStr = array[0];
        while ([saveTimeStr hasPrefix:@"0"]) {
            saveTimeStr = [saveTimeStr substringFromIndex:1];
        }
        NSTimeInterval time=[[NSDate date] timeIntervalSince1970]*1000;
        double saveTime = [saveTimeStr doubleValue];
        double deleteAfter = [array[1] doubleValue];
        if (time>saveTime+deleteAfter*1000) {
            return YES;
        }
    }
    return NO;
}
//获取实际内容
+(NSString*)clearDateInfo:(NSString*)strInfo {
      NSArray *array = nil;
    if (strInfo!=nil&&[MgUtil hasDateInfo:strInfo]) {
            array = [strInfo componentsSeparatedByString:mSeparator];
    }
    NSString *returnStr = nil;
    if (array!=nil&&array.count==3) {
        returnStr = array[2];
    }
    return returnStr;
}

+ (NSArray*)getDateInfoFromDate:(NSString*)data {
    NSArray *array = nil;
    if ([MgUtil hasDateInfo:data]) {
        array = [data componentsSeparatedByString:mSeparator];
    }
    return array;
}

//有时间
+ (BOOL)hasDateInfo:(NSString*)data{
    if (data!=nil &&[data containsString:mSeparator]) {
        return YES;
    }
    return NO;
}


@end
