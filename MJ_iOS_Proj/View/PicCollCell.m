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

@interface PicCollCell()
// cached res
@property(strong, nonatomic) UIImage *imgChecked;
@property(strong, nonatomic) UIImage *imgUnChecked;


@end

@implementation PicCollCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        _imgChecked=[UIImage imageNamed:@"check"];
        _imgUnChecked=[UIImage imageNamed:@"uncheck"];
        
        _imgvPhoto=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, (SCREEN_WIDTH-2*PIC_OFFSET)*0.33 , (SCREEN_WIDTH-2*PIC_OFFSET)*0.33)];
        _imgvCheck=[[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*0.33-THUMBCOLLCELL_IMG_CHECK_OFFSET-THUMBCOLLCELL_IMG_CHECK_WIDTH , SCREEN_WIDTH*0.33-THUMBCOLLCELL_IMG_CHECK_OFFSET-THUMBCOLLCELL_IMG_CHECK_WIDTH, THUMBCOLLCELL_IMG_CHECK_WIDTH, THUMBCOLLCELL_IMG_CHECK_WIDTH)];
        _imgvCheck.image=_imgUnChecked;
        
        [self.contentView addSubview:_imgvPhoto];
        [self.contentView addSubview:_imgvCheck];
    }
    return self;
}


-(void)setSelected{
    _imgvCheck.image=_imgChecked;
}

-(void)setUnSelected{
    _imgvCheck.image=_imgUnChecked;
}


@end
