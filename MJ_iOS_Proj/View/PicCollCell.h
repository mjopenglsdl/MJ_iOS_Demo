//
//  PicCollCell.h
//  MJ_iOS_Proj
//
//  Created by minjie on 05/08/16.
//  Copyright © 2016 minjie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PicCollCell : UICollectionViewCell
@property(strong, nonatomic) UIImageView *imgvPhoto;
@property(strong, nonatomic) UIImageView *imgvCheck;

// pub interfaces
-(void)setSelected;
-(void)setUnSelected;

@end
