//
//  ChoosePhotoVC.m
//  MJ_iOS_Proj
//
//  Created by minjie on 05/08/16.
//  Copyright © 2016 minjie. All rights reserved.
//

#import "ChoosePhotoVC.h"

#import "UIMacro.h"
#import "PicCollCell.h"

#import <AssetsLibrary/ALAsset.h>


@interface ChoosePhotoVC()<UICollectionViewDelegate, UICollectionViewDataSource>

@end


@implementation ChoosePhotoVC

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title=@"Choose Photo";
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize=CGSizeMake(SCREEN_WIDTH*0.33, SCREEN_WIDTH*0.33);
    flowLayout.minimumLineSpacing=1;
    flowLayout.minimumInteritemSpacing=1;
    
    UICollectionView *collectionView=[[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    collectionView.delegate=self;
    collectionView.dataSource=self;
    collectionView.backgroundColor=[UIColor blueColor];
    [collectionView registerClass:[PicCollCell class] forCellWithReuseIdentifier:NSStringFromClass([PicCollCell class])];
    collectionView.frame=CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NAV_AND_STATUS_BAR_HEIGHT);
    
    [self.view addSubview:collectionView];
}


#pragma mark - Delegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 8;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PicCollCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([PicCollCell class]) forIndexPath:indexPath];
    cell.backgroundColor=[UIColor greenColor];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
