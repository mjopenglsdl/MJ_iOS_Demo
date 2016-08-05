//
//  UtilClass.h
//  MJ_iOS_Proj
//
//  Created by minjie on 05/08/16.
//  Copyright © 2016 minjie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UtilClass : NSObject

/*!
 *  Get an unused uuid
 */
+ (NSString *)generateUUID;


/*!
 *  Get the document path of the app
 *
 *  @return Document path
 */
+ (NSString *) getDocumentsPath;


@end
