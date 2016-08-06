//
//  MomentCell.m
//  MJ_iOS_Proj
//
//  Created by minjie on 03/08/16.
//  Copyright © 2016 minjie. All rights reserved.
//

#import "MomentCell.h"

#import "UILabel+Ex.h"
#import "UIView+TTCategory.h"

#import "UIMacro.h"
#import "UtilClass.h"
#import "FontHeightManager.h"
#import "ThumbCollCell.h"


@interface MomentCell()<UICollectionViewDelegate, UICollectionViewDataSource>
@property(strong, nonatomic) UICollectionView *collectionView;
@property(strong, nonatomic) NSArray *aryAssetUrls;

@end


@implementation MomentCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _aryAssetUrls=[[NSArray alloc]init];
        
        _lblName=[[UILabel alloc]initWithFont:Font_Size14 color:[UIColor blueColor]];
        _lblName.text=@"Name";
        
        _lblContent=[[UILabel alloc]initWithFont:Font_Size14 color:[UIColor blackColor]];
        _lblContent.text=@"The content";
        
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
        flowLayout.itemSize=CGSizeMake(THUMB_PIC_WIDTH, THUMB_PIC_WIDTH);
        flowLayout.minimumLineSpacing=PIC_OFFSET;
        flowLayout.minimumInteritemSpacing=PIC_OFFSET;
        
        _collectionView=[[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.delegate=self;
        _collectionView.dataSource=self;
        _collectionView.backgroundColor=[UIColor blueColor];
        [_collectionView registerClass:[ThumbCollCell class] forCellWithReuseIdentifier:NSStringFromClass([ThumbCollCell class])];
        
        
        [self addSubview:_lblName];
        [self addSubview:_lblContent];
        [self addSubview:_collectionView];
        
        _lblName.left=WIDGET_HORI_MARGIN;
        _lblName.width=SCREEN_WIDTH-2*WIDGET_HORI_MARGIN;
        _lblName.top=WIDGET_VERTI_MARGIN;
        _lblName.height=fontHeight_14;
        
        _lblContent.left=_lblName.left;
        _lblContent.width=_lblName.width;
        _lblContent.top=_lblName.bottom+MOMENTCELL_VERTI_OFFSET;
        _lblContent.height=fontHeight_14;
        
        _collectionView.top=_lblContent.bottom+MOMENTCELL_VERTI_OFFSET;
        _collectionView.left=_lblName.left;
        _collectionView.width=SCREEN_WIDTH-2*WIDGET_HORI_MARGIN;
        _collectionView.height=PIC_OFFSET*2+THUMB_PIC_WIDTH*3;
    }
    
    return self;
}


#pragma mark - Delegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.aryAssetUrls.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ThumbCollCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ThumbCollCell class]) forIndexPath:indexPath];
    ALAssetsLibrary *library=[UtilClass defaultAssetsLibrary];
    
    [library assetForURL:[NSURL URLWithString:_aryAssetUrls[indexPath.row]] resultBlock:^(ALAsset *asset) {
        ALAssetRepresentation *rep=[asset defaultRepresentation];
        
        cell.imgvThumb.image =[[UIImage alloc]initWithCGImage:[rep fullResolutionImage] scale:rep.scale orientation:(UIImageOrientation)rep.orientation];
        
    } failureBlock:^(NSError *error) {
        ;
    }];

    return  cell;
}


#pragma mark - Public interfaces
-(void)setupCollectionViewWithUrlArray:(NSArray *)urls
{
    _aryAssetUrls=urls;
    [_collectionView reloadData];
}



@end
