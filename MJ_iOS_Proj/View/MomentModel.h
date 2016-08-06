//
//  MomentModel.h
//  MJ_iOS_Proj
//
//  Created by minjie on 05/08/16.
//  Copyright © 2016 minjie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MomentModel : NSObject
@property(copy,nonatomic) NSString *strName;
@property(copy,nonatomic) NSString *strContent;
@property(strong,nonatomic) NSArray *aryAssetUrls;


@end
