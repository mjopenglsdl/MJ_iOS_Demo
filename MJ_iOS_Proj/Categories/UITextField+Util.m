//
//  UITextField+Util.m
//  MJ_iOS_Proj
//
//  Created by minjie on 03/08/16.
//  Copyright © 2016 minjie. All rights reserved.
//

#import "UITextField+Util.h"

@implementation UITextField (Util)
-(instancetype)initWithPlaceHolder:(NSString *)placeholder{
    if (self=[[UITextField alloc]init]) {
        self.placeholder=placeholder;
    }

    return self;
}

@end
