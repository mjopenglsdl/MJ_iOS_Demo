//
//  MomentCell.m
//  MJ_iOS_Proj
//
//  Created by minjie on 03/08/16.
//  Copyright © 2016 minjie. All rights reserved.
//

#import "MomentCell.h"

#import "UILabel+Ex.h"
#import "UIView+TTCategory.h"

#import "UIMacro.h"
#import "FontHeightManager.h"


@implementation MomentCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor=[UIColor greenColor];
        
        UILabel *lblName=[[UILabel alloc]initWithFont:Font_Size14 color:[UIColor blueColor]];
        lblName.text=@"Name";
        
        UILabel *lblContent=[[UILabel alloc]initWithFont:Font_Size14 color:[UIColor blackColor]];
        lblContent.text=@"The content";
        
        UIImageView *imgv=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"add"]];
        
        [self addSubview:lblName];
        [self addSubview:lblContent];
        [self addSubview:imgv];
        
        lblName.left=WIDGET_HORI_MARGIN;
        lblName.width=SCREEN_WIDTH-2*WIDGET_HORI_MARGIN;
        lblName.top=WIDGET_VERTI_MARGIN;
        lblName.height=fontHeight_14;
        
        lblContent.left=lblName.left;
        lblContent.width=lblName.width;
        lblContent.top=lblName.bottom+MOMENTCELL_VERTI_OFFSET;
        lblContent.height=fontHeight_14;
        
        imgv.top=lblContent.bottom+MOMENTCELL_VERTI_OFFSET;
        imgv.left=lblName.left;
//        imgv.width=THUMB_WIDTH;
//        imgv.height=THUMB_WIDTH;
    }
    
    return self;
}


@end
