//
//  InfoVC.m
//  MJ_iOS_Proj
//
//  Created by minjie on 03/08/16.
//  Copyright © 2016 minjie. All rights reserved.
//

#import "InfoVC.h"
#import "UITextField+Ex.h"
#import "UIMacro.h"
#import "UIView+Ex.h"
#include "UIView+TTCategory.h"

#import "PicCollectionCell.h"

#define CELLID_Pic @"cellID_Pic"

@interface InfoVC()<UICollectionViewDelegate, UICollectionViewDataSource>

@end


@implementation InfoVC

-(instancetype)init{
    if (self=[super init]) {

    }
    return self;
}

-(void)viewDidLoad{
    // ui
    self.view.backgroundColor=[UIColor grayColor];
    self.navigationItem.title=@"Info";

    [self setupUI];

    // gesture
    UISwipeGestureRecognizer *swipeLeft=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(action_swipeLeft:)];
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:swipeLeft];
    
}

// responders
GEN_ResignAllResponders


#pragma mark - UI 
- (void)setupUI
{
    UIScrollView *container=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-TAB_BAR_HEIGHT)];
    container.backgroundColor=[UIColor yellowColor];
    
    UITextField *txtfName=[[UITextField alloc]initWithPlaceHolder:@"Your Name"];
    txtfName.returnKeyType=UIReturnKeyDone;
    
    UITextView *txtvContent=[[UITextView alloc]init];
    txtvContent.returnKeyType=UIReturnKeyDone;
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize=CGSizeMake(PIC_WIDTH, PIC_WIDTH);
    flowLayout.minimumLineSpacing=COLLECTION_ITEM_DIST;
    flowLayout.minimumInteritemSpacing=14.0f;
    
    UICollectionView *collectionView=[[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    collectionView.delegate=self;
    collectionView.dataSource=self;
    collectionView.backgroundColor=[UIColor blueColor];
    [collectionView registerClass:[PicCollectionCell class] forCellWithReuseIdentifier:@"cellID_Pic"];
    
    UIButton *btnSave=[[UIButton alloc]init];
    [btnSave setTitle:@"Save" forState:UIControlStateNormal];
    
    // add
    [container addSubview:txtfName];
    [container addSubview:txtvContent];
    [container addSubview:collectionView];
    [container addSubview:btnSave];
    [self.view addSubview:container];

    // layout
    txtfName.top=WIDGET_VERTI_MARGIN;
    txtfName.left=WIDGET_HORI_MARGIN;
    txtfName.width=SCREEN_WIDTH-2*WIDGET_HORI_MARGIN;
    txtfName.height=TEXTFIELD_HEIGHT;
    
    txtvContent.top=txtfName.bottom+WIDGET_COMMON_OFFSET;
    txtvContent.left=WIDGET_HORI_MARGIN;
    txtvContent.width=SCREEN_WIDTH-2*WIDGET_HORI_MARGIN;
    txtvContent.height=TEXTFIELD_HEIGHT*2;
    
    collectionView.top=txtvContent.bottom+WIDGET_COMMON_OFFSET;
    collectionView.left=WIDGET_HORI_MARGIN;
    collectionView.width=SCREEN_WIDTH-2*WIDGET_HORI_MARGIN;
    collectionView.height=COLLECTION_ITEM_DIST*2+PIC_WIDTH*3;

    btnSave.top=collectionView.bottom+WIDGET_COMMON_OFFSET;
    btnSave.left=WIDGET_HORI_MARGIN;
    btnSave.width=SCREEN_WIDTH-2*WIDGET_HORI_MARGIN;
    btnSave.height=BUTTON_HEIGHT;
    
    container.contentSize=CGSizeMake(SCREEN_WIDTH, btnSave.bottom);
}


#pragma mark - Delegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 9;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PicCollectionCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:CELLID_Pic forIndexPath:indexPath];
    cell.backgroundColor=[UIColor redColor];
    
    return cell;
}



#pragma mark - Actions
- (void)action_swipeLeft:(id)sender
{
    [self.navigationController.tabBarController setSelectedIndex:1];
}


@end
