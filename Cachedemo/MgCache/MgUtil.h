//
//  MgUtil.h
//  Cachedemo
//
//  Created by mangues on 15/12/28.
//  Copyright © 2015年 mangues. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MgUtil : NSObject
+ (NSString*)newStringWithDateInfo:(int)saveTime content:(NSString*)value;
+ (BOOL)isDue:(NSString*)str;

+(NSString*)clearDateInfo:(NSString*)strInfo;
@end
