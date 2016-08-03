//
//  NSString+Ex.m
//  MJ_iOS_Proj
//
//  Created by minjie on 03/08/16.
//  Copyright © 2016 minjie. All rights reserved.
//

#import "NSString+Ex.h"

@implementation NSString (Ex)

- (CGSize)sizeWithFontSize:(UIFont*)aFont displaySize:(CGSize)aSize
{
    NSDictionary *attributeDic = @{NSFontAttributeName : aFont};
    CGSize size = aSize;
    CGSize lastSize = [self boundingRectWithSize:size
                                         options:NSStringDrawingUsesLineFragmentOrigin
                                      attributes:attributeDic
                                         context:Nil].size;
    return lastSize;
}


@end
