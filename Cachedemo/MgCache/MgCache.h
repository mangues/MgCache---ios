//
//  MgCache.h
//  Cachedemo
//
//  Created by mangues on 15/12/25.
//  Copyright © 2015年 mangues. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MgCacheManager.h"
@interface MgCache : NSObject
@property (nonatomic,strong)MgCacheManager* mCache;
+ (MgCache*)getMgCache;
+ (MgCache*)getMgCache:(NSString*)cacheName;
- (void)putValue:(NSString*)value forKey:(NSString*)key;
- (void)putValue:(NSString*)value forKey:(NSString*)key saveTime:(int) saveTime;
- (NSString*)getAsString:(NSString*)key;
- (BOOL)isSame:(NSString*)value forKey:(NSString*)key;
@end
