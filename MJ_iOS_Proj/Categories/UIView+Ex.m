//
//  UIView+Ex.m
//  MJ_iOS_Proj
//
//  Created by minjie on 04/08/16.
//  Copyright © 2016 minjie. All rights reserved.
//

#import "UIView+Ex.h"

@implementation UIView (Ex)

- (void)resignAllFirstResponder
{
    [self resignFirstResponder];
    
    for (UIView* view in self.subviews) {
        [view resignAllFirstResponder];
    }
}

@end
