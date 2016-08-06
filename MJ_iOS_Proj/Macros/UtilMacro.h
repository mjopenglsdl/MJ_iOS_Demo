//
//  UtilMacro.h
//  MJ_iOS_Proj
//
//  Created by minjie on 03/08/16.
//  Copyright © 2016 minjie. All rights reserved.
//

#ifndef UtilMacro_h
#define UtilMacro_h

///////////////////////////////////  Singleton  //////////////////////////////////////////////
#define SINGLETON_GENERATOR(class_name, shared_func_name)    \
static class_name * s_##class_name = nil;                       \
+ (class_name *)shared_func_name                                \
{                                                               \
static dispatch_once_t once;                                \
dispatch_once(&once, ^{                                     \
s_##class_name = [[super allocWithZone:NULL] init];     \
});                                                         \
return s_##class_name;                                      \
}                                                               \
+ (class_name *)allocWithZone:(NSZone *)zone                    \
{                                                               \
return s_##class_name;                                      \
}                                                               \
- (class_name *)copyWithZone:(NSZone *)zone                     \
{                                                               \
return self;                                                \
}                                                               \

// get singleton instance
#define SINGLETON_SHARED_INSTANCE(class_name)    s_##class_name

// check if singleton has init
#define SINGLETON_CHECK_INITED(class_name)                   \
{if (SINGLETON_SHARED_INSTANCE(class_name)) return SINGLETON_SHARED_INSTANCE(class_name);}
//////////////////////////////////////////////////////////////////////////////////////////////////////

//weakself
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

// File path
#define PATH_DB @"/db"

// table
#define TABLE_Moment @"Moment"

/// import
#import "NSArray+Ex.h"
#import "NSDictionary+Ex.h"
#import "UtilClass.h"

#endif /* UtilMacro_h */
