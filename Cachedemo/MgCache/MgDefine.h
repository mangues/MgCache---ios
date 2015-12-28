//
//  MgDefine.h
//  Cachedemo
//
//  Created by mangues on 15/12/28.
//  Copyright © 2015年 mangues. All rights reserved.
//

#import <Foundation/Foundation.h>
#define DLog(...) NSLog(@"%s %@", __PRETTY_FUNCTION__, [NSString stringWithFormat:__VA_ARGS__])
//解决数组越界
//有返回值
#define SAFE_OBJECT_OF_ARRAY_AT_INDEX(_ARRAY_,_INDEX_) ((_ARRAY_)&&(_INDEX_>=0)&&(_INDEX_<[_ARRAY_ count])?([_ARRAY_ objectAtIndex:_INDEX_]):(nil))

//解决截取字符串的问题
#define SAFE_SUBSTRING_TO_INDEX(_STR_,_INX_) ((_INX_ <= [_STR_ length])? ([_STR_ substringToIndex:_INX_]):(nil))

//解决将空值加入数组造造成的崩溃

#define SAFE_ADD_OBJECT_INTO_ARRAY(_ARRAY_,_OBJ_) ((_OBJ_)? ([_ARRAY_ addObject:_OBJ_]) : (nil))
