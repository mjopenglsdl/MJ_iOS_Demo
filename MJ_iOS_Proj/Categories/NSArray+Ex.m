//
//  NSArray+Ex.m
//  MJ_iOS_Proj
//
//  Created by minjie on 05/08/16.
//  Copyright © 2016 minjie. All rights reserved.
//

#import "NSArray+Ex.h"

@implementation NSArray (Ex)

- (id)safeObjectAtIndex:(NSUInteger)index
{
    if(self && self.count > 0 && index < self.count)
    {
        id obj = [self objectAtIndex:index];
        if ([obj isKindOfClass:[NSNull class]])
        {
            obj = nil;
        }
        return obj;
    }
    return nil;
}

@end
