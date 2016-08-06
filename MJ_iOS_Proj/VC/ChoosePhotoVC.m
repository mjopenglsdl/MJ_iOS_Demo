//
//  ChoosePhotoVC.m
//  MJ_iOS_Proj
//
//  Created by minjie on 05/08/16.
//  Copyright © 2016 minjie. All rights reserved.
//

#import "ChoosePhotoVC.h"

#import "UIMacro.h"
#import "UtilClass.h"
#import "PicCollCell.h"


#define kALAsset @"ALAsset"
#define kSelected @"kSelected"

@interface ChoosePhotoVC()<UICollectionViewDelegate, UICollectionViewDataSource>
@property(strong, nonatomic) NSMutableArray *muaryAlAsset;     // contains dictionary: ALAsset Selected Status

@end


@implementation ChoosePhotoVC

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title=@"Choose Photo";
    
    [self setupAlAssetLib];
//    [self setupUI];
}


#pragma mark - UI
- (void)setupUI
{
    // nav bar
    UIBarButtonItem *leftBarBtn=[[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(action_cancel:)];
    UIBarButtonItem *rightBarBtn=[[UIBarButtonItem alloc]initWithTitle:@"Confirm" style:UIBarButtonItemStylePlain target:self action:@selector(action_confirm:)];
    
    self.navigationItem.leftBarButtonItem=leftBarBtn;
    self.navigationItem.rightBarButtonItem=rightBarBtn;
    
    // collection view
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize=CGSizeMake((SCREEN_WIDTH-2*PIC_OFFSET)*0.33, (SCREEN_WIDTH-2*PIC_OFFSET)*0.33);
    flowLayout.minimumLineSpacing=PIC_OFFSET;
    flowLayout.minimumInteritemSpacing=PIC_OFFSET;
    
    UICollectionView *collectionView=[[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    collectionView.delegate=self;
    collectionView.dataSource=self;
    collectionView.backgroundColor=[UIColor whiteColor];
    [collectionView registerClass:[PicCollCell class] forCellWithReuseIdentifier:NSStringFromClass([PicCollCell class])];
    collectionView.frame=CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    
    [self.view addSubview:collectionView];
}


#pragma mark - ALAsset
-(void)setupAlAssetLib
{
    _muaryAlAsset=[[NSMutableArray alloc]init];
    
    ALAssetsLibrary *assetLib=[UtilClass defaultAssetsLibrary];

    [assetLib enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {

        if (group) {
            [group setAssetsFilter:[ALAssetsFilter allPhotos]];
            [group enumerateAssetsWithOptions:NSEnumerationReverse usingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
                if (result) {
                    // Type: ALAssetRepresentation
                    NSMutableDictionary *mudictItem=[[NSMutableDictionary alloc]init];
                    [mudictItem setObject:result forKey:kALAsset];
                    [mudictItem setObject:@NO forKey:kSelected];
                    [_muaryAlAsset addObject:mudictItem];
                }
            }];
        }
        else
        {
            // Group iterate completed -> UI init
            [self setupUI];
        }
    } failureBlock:^(NSError *error) {
        NSLog(@"%@ >>> ALAsset error: %@", [self class], error);
    }];
    

}

#pragma mark - Delegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _muaryAlAsset.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PicCollCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([PicCollCell class]) forIndexPath:indexPath];
    ALAssetRepresentation *rep=[[[_muaryAlAsset objectAtIndex:indexPath.row]objectForKey:kALAsset]defaultRepresentation];
    cell.imgvPhoto.image=[[UIImage alloc]initWithCGImage:[rep fullResolutionImage] scale:rep.scale orientation:(UIImageOrientation)rep.orientation];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableDictionary *oneItem=[_muaryAlAsset objectAtIndex:indexPath.row];
    NSInteger selected=[[oneItem objectForKey:kSelected]integerValue];
    
    if (selected) {
        [oneItem setObject:@NO forKey:kSelected];
        PicCollCell *cell=(PicCollCell * )[collectionView cellForItemAtIndexPath:indexPath];
        [cell setUnSelected];
    }
    else
    {
        [oneItem setObject:@YES forKey:kSelected];
        PicCollCell *cell=(PicCollCell * )[collectionView cellForItemAtIndexPath:indexPath];
        [cell setSelected];
    }
}


#pragma mark - Actions
- (void)action_cancel:(UIBarButtonItem *)sender
{
    [self dismissViewControllerAnimated:YES completion:NO];
}

- (void)action_confirm:(UIBarButtonItem *)sender
{
    if (_callback) {
        NSMutableArray *muaryALAsset=[[NSMutableArray alloc]init];
        for (NSMutableDictionary *dictItem in _muaryAlAsset) {
            if (YES==[[dictItem objectForKey:kSelected]integerValue]) {
                [muaryALAsset addObject:[dictItem objectForKey:kALAsset]];
            }
        }
        
        NSArray *aryALAsset=[muaryALAsset copy];
        [_callback photoChooseFinished:aryALAsset];
    }
    [self dismissViewControllerAnimated:YES completion:NO];
}

@end
