//
//  MomentModel.m
//  MJ_iOS_Proj
//
//  Created by minjie on 05/08/16.
//  Copyright © 2016 minjie. All rights reserved.
//

#import "MomentModel.h"
#import "UtilClass.h"


@implementation MomentModel
-(instancetype)init
{
    if (self=[super init]) {
        _strRecordID=[UtilClass generateUUID];
    }
    return self;
}

- (NSString *) urlStringFromUrlArray
{
    return nil;
}

@end
