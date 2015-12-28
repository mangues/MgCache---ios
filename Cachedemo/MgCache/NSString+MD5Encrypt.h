//
//  NSString+MD5Encrypt.h
//  Cachedemo
//
//  Created by mangues on 15/12/25.
//  Copyright © 2015年 mangues. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>  
@interface NSString (MD5Encrypt)
- (NSString *)md5Encrypt;
@end
