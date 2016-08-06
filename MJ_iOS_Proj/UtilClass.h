//
//  UtilClass.h
//  MJ_iOS_Proj
//
//  Created by minjie on 05/08/16.
//  Copyright © 2016 minjie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>


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


/*!
 *  Get the default ALAssetsLibrary
 *
 *  @return default ALAssetsLibrary
 */
+ (ALAssetsLibrary *)defaultAssetsLibrary;


@end
