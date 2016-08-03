//
//  UILabel+Ex.m
//  MJ_iOS_Proj
//
//  Created by minjie on 03/08/16.
//  Copyright © 2016 minjie. All rights reserved.
//

#import "UILabel+Ex.h"

@implementation UILabel (Ex)
-(instancetype)initWithFont:(UIFont *)font color:(UIColor *)color{
    if (self=[[UILabel alloc]init]) {
        self.font=font;
        self.textColor=color;
    }
    return self;
}

@end
