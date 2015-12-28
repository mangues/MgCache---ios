//
//  NSObject+toJsonString.m
//  ct_trip
//
//  Created by TTS on 15/12/4.
//  Copyright © 2015年 tts. All rights reserved.
//

#import "NSObject+toJsonString.h"
#import "SBJsonWriter.h"
@implementation NSObject (toJsonString)
- (NSString *)getJson:(NSDictionary *)dic
{
    SBJsonWriter *writer = [[SBJsonWriter alloc] init];
    NSString *jsonString=nil;
    jsonString=[writer stringWithObject:dic];
    return jsonString;
}
@end
