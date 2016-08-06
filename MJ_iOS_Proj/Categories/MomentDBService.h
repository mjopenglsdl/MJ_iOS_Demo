//
//  MomentDBService.h
//  MJ_iOS_Proj
//
//  Created by minjie on 06/08/16.
//  Copyright © 2016 minjie. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "UtilMacro.h"
#import "MomentModel.h"


@interface MomentDBService : NSObject
+(MomentDBService *)sharedService;

// CRUD
- (BOOL)addRecord:(MomentModel *)model;
- (BOOL)removeRecordWithID:(NSString *)recordID;


@end