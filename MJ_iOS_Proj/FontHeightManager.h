//
//  FontHeightManager.h
//  MJ_iOS_Proj
//
//  Created by minjie on 03/08/16.
//  Copyright © 2016 minjie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FontHeightManager : NSObject

@property(assign,nonatomic) CGFloat fontHeightOf12;
@property(assign,nonatomic) CGFloat fontHeightOf13;
@property(assign,nonatomic) CGFloat fontHeightOf14;
@property(assign,nonatomic) CGFloat fontHeightOf15;
@property(assign,nonatomic) CGFloat fontHeightOf16;

+ (FontHeightManager *)sharedManager;

@end
