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
#import "UIView+TTCategory.h"
#import "UtilMacro.h"
#import "ChoosePhotoVC.h"
#import "ThumbCollCell.h"
#import "MomentDBService.h"

#import <AssetsLibrary/ALAsset.h>

@interface InfoVC()<UICollectionViewDelegate, UICollectionViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, UITextViewDelegate, ChoosePhotoVCCallback>
@property(strong, nonatomic) NSArray *aryALAsset;
@property(strong, nonatomic) UICollectionView *collectionView;
@property(strong, nonatomic) UITextField *txtfName;
@property(strong, nonatomic) UITextView *txtvContent;

@end


@implementation InfoVC

-(void)viewDidLoad{
    [super viewDidLoad];
    
    // ui
    self.view.backgroundColor=[UIColor grayColor];
    self.navigationItem.title=@"Info";

    [self setupUI];

    // gesture
    UISwipeGestureRecognizer *swipeLeft=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(action_swipeLeft:)];
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:swipeLeft];
    
}


#pragma mark - UI 
- (void)setupUI
{
    UIScrollView *container=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-TAB_BAR_HEIGHT)];
    container.backgroundColor=[UIColor yellowColor];
    UITapGestureRecognizer *gesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(action_resignResponder:)];
    gesture.numberOfTapsRequired=1;
    [container addGestureRecognizer:gesture];
    
    _txtfName=[[UITextField alloc]initWithPlaceHolder:@"Your Name"];
    _txtfName.returnKeyType=UIReturnKeyDone;
    _txtfName.backgroundColor=[UIColor whiteColor];
    _txtfName.delegate=self;
    
    _txtvContent=[[UITextView alloc]init];
    _txtvContent.returnKeyType=UIReturnKeyDone;
    _txtvContent.delegate=self;
    
    UIButton *btnSelect=[[UIButton alloc]init];
    [btnSelect setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    btnSelect.layer.borderWidth=1.0f;
    [btnSelect setTitle:@"Select Picture" forState:UIControlStateNormal];
    [btnSelect addTarget:self action:@selector(action_selectPic:) forControlEvents:UIControlEventTouchUpInside];
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize=CGSizeMake(THUMB_PIC_WIDTH, THUMB_PIC_WIDTH);
    flowLayout.minimumLineSpacing=PIC_OFFSET;
    flowLayout.minimumInteritemSpacing=PIC_OFFSET;
    
    _collectionView=[[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    _collectionView.delegate=self;
    _collectionView.dataSource=self;
    _collectionView.backgroundColor=[UIColor blueColor];
    [_collectionView registerClass:[ThumbCollCell class] forCellWithReuseIdentifier:NSStringFromClass([ThumbCollCell class])];
    
    UIButton *btnSave=[[UIButton alloc]init];
    [btnSave setTitle:@"Save" forState:UIControlStateNormal];
    btnSave.layer.borderWidth=1.0f;
    [btnSave setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btnSave addTarget:self action:@selector(action_save:) forControlEvents:UIControlEventTouchUpInside];
    
    // add
    [container addSubview:_txtfName];
    [container addSubview:_txtvContent];
    [container addSubview:btnSelect];
    [container addSubview:_collectionView];
    [container addSubview:btnSave];
    [self.view addSubview:container];

    // layout
    _txtfName.top=WIDGET_VERTI_MARGIN;
    _txtfName.left=WIDGET_HORI_MARGIN;
    _txtfName.width=SCREEN_WIDTH-2*WIDGET_HORI_MARGIN;
    _txtfName.height=TEXTFIELD_HEIGHT;
    
    _txtvContent.top=_txtfName.bottom+WIDGET_COMMON_OFFSET;
    _txtvContent.left=WIDGET_HORI_MARGIN;
    _txtvContent.width=SCREEN_WIDTH-2*WIDGET_HORI_MARGIN;
    _txtvContent.height=TEXTFIELD_HEIGHT*2;
    
    btnSelect.top=_txtvContent.bottom+WIDGET_COMMON_OFFSET;
    btnSelect.left=WIDGET_HORI_MARGIN;
    btnSelect.width=SCREEN_WIDTH-2*WIDGET_HORI_MARGIN;
    btnSelect.height=BUTTON_HEIGHT;
    
    _collectionView.top=btnSelect.bottom+WIDGET_COMMON_OFFSET;
    _collectionView.left=WIDGET_HORI_MARGIN;
    _collectionView.width=SCREEN_WIDTH-2*WIDGET_HORI_MARGIN;
    _collectionView.height=PIC_OFFSET*2+THUMB_PIC_WIDTH*3;

    btnSave.top=_collectionView.bottom+WIDGET_COMMON_OFFSET;
    btnSave.left=WIDGET_HORI_MARGIN;
    btnSave.width=SCREEN_WIDTH-2*WIDGET_HORI_MARGIN;
    btnSave.height=BUTTON_HEIGHT;
    
    container.contentSize=CGSizeMake(SCREEN_WIDTH, btnSave.bottom);
}


#pragma mark - Delegate
// txt field
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
// txt view
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
    }
    return true;
}

// collection view
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.aryALAsset.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ThumbCollCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ThumbCollCell class]) forIndexPath:indexPath];
    ALAssetRepresentation *rep=[[self.aryALAsset objectAtIndex:indexPath.row]defaultRepresentation];
    cell.imgvThumb.image=[[UIImage alloc]initWithCGImage:[rep fullResolutionImage] scale:rep.scale orientation:(UIImageOrientation)rep.orientation];

    return cell;
}

// image picker
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage *img=[info objectForKey:UIImagePickerControllerOriginalImage];

    ALAssetsLibrary *library=[UtilClass defaultAssetsLibrary];

    [library writeImageToSavedPhotosAlbum:img.CGImage
                                 metadata:[info objectForKey:UIImagePickerControllerMediaMetadata]
                          completionBlock:^(NSURL *assetURL, NSError *error) {
                              
                              [[UtilClass defaultAssetsLibrary]assetForURL:assetURL resultBlock:^(ALAsset *asset) {
                                  self.aryALAsset=@[asset];
                                  [_collectionView reloadData];
                              } failureBlock:^(NSError *error) {
                                  ;
                              }];
                          }];
    [picker dismissViewControllerAnimated:YES completion:NULL];

}


#pragma mark - Actions
- (void)action_selectPic:(UIButton *)sender
{
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:nil message:@"Select Picture" preferredStyle:UIAlertControllerStyleActionSheet];
    
    /// action tabs
    // photo
    UIAlertAction *actionTakePhoto=[UIAlertAction actionWithTitle:@"Take Photo" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UIImagePickerController *pickerController=[[UIImagePickerController alloc]init];
        pickerController.delegate=self;
        pickerController.sourceType=UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:pickerController animated:YES completion:nil];
    }];
    // photo library
    UIAlertAction *actionSelect=[UIAlertAction actionWithTitle:@"Select Photo" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        ALAuthorizationStatus authStatus=[ALAssetsLibrary authorizationStatus];
        if (authStatus==ALAuthorizationStatusRestricted || authStatus ==ALAuthorizationStatusDenied) {
            UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"Info" message:@"You have to allow access to photo for this app" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
        }else{
            ChoosePhotoVC *choosePhotoVC = [[ChoosePhotoVC alloc]init];
            choosePhotoVC.callback=self;
            UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:choosePhotoVC];
            [self presentViewController:nav animated:YES completion:nil];
        }
    }];
    // cancel
    UIAlertAction *actionCancel=[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    
    [alertController addAction:actionTakePhoto];
    [alertController addAction:actionSelect];
    [alertController addAction:actionCancel];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)action_save:(UIButton *)sender
{
    MomentModel *model=[[MomentModel alloc]init];
    model.strName=_txtfName.text;
    model.strContent=_txtvContent.text;
    
    NSMutableArray *muaryUrls=[[NSMutableArray alloc]init];
    for (ALAsset *asset in _aryALAsset) {
        [muaryUrls addObject: [asset defaultRepresentation].url.absoluteString] ;
    }
    model.aryAssetUrls=[muaryUrls copy];
    
    [[MomentDBService sharedService]addRecord:model];
    
    // clear UI
    _txtfName.text=@"";
    _txtvContent.text=@"";
    _aryALAsset=nil;
    [_collectionView reloadData];
    
    UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"Info" message:@"Info saved successfully" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];

}


- (void)action_swipeLeft:(id)sender
{
    [self.navigationController.tabBarController setSelectedIndex:1];
}

- (void)action_resignResponder:(id)sender
{
    [self.view resignAllFirstResponder];
}


#pragma mark - Callback
-(void)photoChooseFinished:(NSArray *)alAssets
{
    if (alAssets.count<=9) {
        self.aryALAsset=alAssets;
    }
    else
    {
        NSMutableArray *muary=[[NSMutableArray alloc]init];
        for (NSInteger i=0; i<9; i++) {
            [muary addObject:alAssets[i]];
        }
        self.aryALAsset=[muary copy];
    }
    
    [_collectionView reloadData];
}


#pragma mark - Lazy loading
- (NSArray *)aryALAsset{
    if (!_aryALAsset) {
        _aryALAsset=[[NSArray alloc]init];
    }
    return _aryALAsset;
}

@end
