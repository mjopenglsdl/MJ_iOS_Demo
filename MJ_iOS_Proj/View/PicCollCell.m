//
//  PicCollCell.m
//  MJ_iOS_Proj
//
//  Created by minjie on 05/08/16.
//  Copyright © 2016 minjie. All rights reserved.
//

#import "PicCollCell.h"

#import "UIMacro.h"

#define THUMBCOLLCELL_IMG_CHECK_WIDTH 30.0f
#define THUMBCOLLCELL_IMG_CHECK_OFFSET 10.0f


@implementation PicCollCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        UIImageView *imgv=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH*0.33 , SCREEN_WIDTH*0.33)];
        UIImageView *imgCheck=[[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*0.33-THUMBCOLLCELL_IMG_CHECK_OFFSET-THUMBCOLLCELL_IMG_CHECK_WIDTH , SCREEN_WIDTH*0.33-THUMBCOLLCELL_IMG_CHECK_OFFSET-THUMBCOLLCELL_IMG_CHECK_WIDTH, THUMBCOLLCELL_IMG_CHECK_WIDTH, THUMBCOLLCELL_IMG_CHECK_WIDTH)];
        imgCheck.image=[UIImage imageNamed:@"uncheck"];
        
        [self.contentView addSubview:imgv];
        [self.contentView addSubview:imgCheck];
        self.contentView.backgroundColor=[UIColor yellowColor];
    }
    return self;
}


@end
