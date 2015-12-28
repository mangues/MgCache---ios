//
//  NSObject+toJsonString.h
//  ct_trip
//
//  Created by TTS on 15/12/4.
//  Copyright © 2015年 tts. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (toJsonString)
- (NSString *)getJson:(NSDictionary *)dic;
@end
