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
#import "UtilClass.h"
#import "UtilMacro.h"
#import "ChoosePhotoVC.h"
#import "ThumbCollCell.h"


@interface InfoVC()<UICollectionViewDelegate, UICollectionViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, UITextViewDelegate>

@end


@implementation InfoVC

-(instancetype)init{
    if (self=[super init]) {

    }
    return self;
}

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
    
    UITextField *txtfName=[[UITextField alloc]initWithPlaceHolder:@"Your Name"];
    txtfName.returnKeyType=UIReturnKeyDone;
    txtfName.delegate=self;
    
    UITextView *txtvContent=[[UITextView alloc]init];
    txtvContent.returnKeyType=UIReturnKeyDone;
    txtvContent.delegate=self;
    
    UIButton *btnSelect=[[UIButton alloc]init];
    [btnSelect setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    btnSelect.layer.borderWidth=1.0f;
    [btnSelect setTitle:@"Select Picture" forState:UIControlStateNormal];
    [btnSelect addTarget:self action:@selector(action_selectPic:) forControlEvents:UIControlEventTouchUpInside];
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize=CGSizeMake(THUMB_WIDTH, THUMB_WIDTH);
    flowLayout.minimumLineSpacing=COLLECTION_ITEM_VERTI_DIST;
    flowLayout.minimumInteritemSpacing=14.0f;
    
    UICollectionView *collectionView=[[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    collectionView.delegate=self;
    collectionView.dataSource=self;
    collectionView.backgroundColor=[UIColor blueColor];
    [collectionView registerClass:[ThumbCollCell class] forCellWithReuseIdentifier:NSStringFromClass([ThumbCollCell class])];
    
    UIButton *btnSave=[[UIButton alloc]init];
    [btnSave setTitle:@"Save" forState:UIControlStateNormal];
    btnSave.layer.borderWidth=1.0f;
    [btnSave setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btnSave addTarget:self action:@selector(action_save:) forControlEvents:UIControlEventTouchUpInside];
    
    // add
    [container addSubview:txtfName];
    [container addSubview:txtvContent];
    [container addSubview:btnSelect];
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
    
    btnSelect.top=txtvContent.bottom+WIDGET_COMMON_OFFSET;
    btnSelect.left=WIDGET_HORI_MARGIN;
    btnSelect.width=SCREEN_WIDTH-2*WIDGET_HORI_MARGIN;
    btnSelect.height=BUTTON_HEIGHT;
    
    collectionView.top=btnSelect.bottom+WIDGET_COMMON_OFFSET;
    collectionView.left=WIDGET_HORI_MARGIN;
    collectionView.width=SCREEN_WIDTH-2*WIDGET_HORI_MARGIN;
    collectionView.height=COLLECTION_ITEM_VERTI_DIST*2+THUMB_WIDTH*3;

    btnSave.top=collectionView.bottom+WIDGET_COMMON_OFFSET;
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
    return 9;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ThumbCollCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ThumbCollCell class]) forIndexPath:indexPath];
    cell.backgroundColor=[UIColor redColor];
    
    return cell;
}

// image picker
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage *img=[info objectForKey:UIImagePickerControllerOriginalImage];
    NSData *dataImg= UIImagePNGRepresentation(img);
    
    NSString *strUniqueID=[UtilClass generateUUID];
    NSString *filePath=[NSString stringWithFormat:@"%@/%@/%@.png", [UtilClass getDocumentsPath], PATH_Pic , strUniqueID];

    NSError *err=nil;
    BOOL result=[dataImg writeToFile:filePath options:NSDataWritingAtomic error:&err];
    
    if (false==result) {
        NSLog(@"%@ >>> Failed to save the photo", [self class]);
    }
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
        ChoosePhotoVC *choosePhotoVC = [[ChoosePhotoVC alloc]init];
        UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:choosePhotoVC];
        [self presentViewController:nav animated:YES completion:nil];
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

}


- (void)action_swipeLeft:(id)sender
{
    [self.navigationController.tabBarController setSelectedIndex:1];
}

- (void)action_resignResponder:(id)sender
{
    [self.view resignAllFirstResponder];
}


@end
