//
//  NSDictionary+Ex.m
//  MJ_iOS_Proj
//
//  Created by minjie on 05/08/16.
//  Copyright © 2016 minjie. All rights reserved.
//

#import "NSDictionary+Ex.h"

@implementation NSDictionary (Ex)

- (id)safeObjectForKey:(NSString *)key{
    id value = [self objectForKey:key];
    if([value isKindOfClass:[NSNull class]]){
        value = nil;
    }
    return value;
}
@end
