//
//  MgCacheManager.h
//  Cachedemo
//
//  Created by mangues on 15/12/25.
//  Copyright © 2015年 mangues. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MgDefine.h"
@interface MgCacheManager : NSObject
- (id)init:(NSString*)cacheDir;
- (NSString*)newFile:(NSString*)key andValue:(NSString*)value;
- (NSString*)getFileDir:(NSString*)key;
- (BOOL)removeFile:(NSString*)fileDir;
- (BOOL)isSame:(NSString*)value forKey:(NSString*)key;
@end
