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
    NSMutableString *strTotal=[[NSMutableString alloc]init];
    
    for (NSInteger i=0; i< _aryAssetUrls.count; i++) {
        if (0!=i) {
            [strTotal appendString:@"|"];
        }
        [strTotal appendString:_aryAssetUrls[i]];
    }
    
    return strTotal;
}

- (void)setAssetUrlWithUrlString:(NSString *)urlStr
{
    if (urlStr) {
        _aryAssetUrls=[urlStr componentsSeparatedByString:@"|"];
    }
}


@end
