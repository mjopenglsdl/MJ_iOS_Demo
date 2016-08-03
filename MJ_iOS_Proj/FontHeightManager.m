//
//  FontHeightManager.m
//  MJ_iOS_Proj
//
//  Created by minjie on 03/08/16.
//  Copyright © 2016 minjie. All rights reserved.
//

#import "FontHeightManager.h"

#import "UtilMacro.h"
#import "UIMacro.h"
#import "NSString+Ex.h"

@implementation FontHeightManager

SINGLETON_GENERATOR(FontHeightManager, sharedManager)

-(instancetype)init{
    if (self=[super init]) {
        NSString *tmpNameStr=@"test";
        _fontHeightOf12 =[tmpNameStr sizeWithFontSize:Font_Size12 displaySize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)].height;
        _fontHeightOf13 =[tmpNameStr sizeWithFontSize:Font_Size13 displaySize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)].height;
        _fontHeightOf14 =[tmpNameStr sizeWithFontSize:Font_Size14 displaySize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)].height;
        _fontHeightOf15 =[tmpNameStr sizeWithFontSize:Font_Size15 displaySize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)].height;
        _fontHeightOf16 =[tmpNameStr sizeWithFontSize:Font_Size16 displaySize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)].height;
    }
    return self;
}


@end
