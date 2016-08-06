//
//  ThumbCollCell.m
//  MJ_iOS_Proj
//
//  Created by minjie on 04/08/16.
//  Copyright © 2016 minjie. All rights reserved.
//

#import "ThumbCollCell.h"

#import "UIMacro.h"

@implementation ThumbCollCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        _imgvThumb=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, THUMB_PIC_WIDTH , THUMB_PIC_WIDTH)];
        
        [self.contentView addSubview:_imgvThumb];
    }
    return self;
}

@end
