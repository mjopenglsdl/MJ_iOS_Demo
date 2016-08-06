//
//  MomentCell.h
//  MJ_iOS_Proj
//
//  Created by minjie on 03/08/16.
//  Copyright © 2016 minjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/ALAsset.h>

#define MOMENTCELL_VERTI_OFFSET 10.0f


@interface MomentCell : UITableViewCell
@property(strong, nonatomic) UILabel *lblName;
@property(strong, nonatomic) UILabel *lblContent;

-(void)setupCollectionViewWithUrlArray:(NSArray *)urls;

@end
