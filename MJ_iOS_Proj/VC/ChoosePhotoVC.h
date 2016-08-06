//
//  ChoosePhotoVC.h
//  MJ_iOS_Proj
//
//  Created by minjie on 05/08/16.
//  Copyright © 2016 minjie. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ChoosePhotoVCCallback
@required
-(void)photoChooseFinished:(NSArray *)alAssets;

@end


@interface ChoosePhotoVC : UIViewController
@property(weak, nonatomic) id<ChoosePhotoVCCallback> callback;

@end
