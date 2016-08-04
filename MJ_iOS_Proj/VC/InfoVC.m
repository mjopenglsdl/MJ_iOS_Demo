//
//  InfoVC.m
//  MJ_iOS_Proj
//
//  Created by minjie on 03/08/16.
//  Copyright © 2016 minjie. All rights reserved.
//

#import "InfoVC.h"
#import "UITextField+Ex.h"
#import "Masonry.h"
#import "UIMacro.h"
#import "UIView+Ex.h"


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
    UITextField *txtfName=[[UITextField alloc]initWithPlaceHolder:@"Your Name"];
    UITextView *txtvContent=[[UITextView alloc]init];
    
    UIButton *btnAdd=[[UIButton alloc]init];
    [btnAdd setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    
    UIButton *btnSave=[[UIButton alloc]init];
    [btnSave setTitle:@"Save" forState:UIControlStateNormal];
    
    [self.view addSubview:txtfName];
    [self.view addSubview:txtvContent];
    [self.view addSubview:btnAdd];
    [self.view addSubview:btnSave];


    [txtfName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).mas_offset(NAV_AND_STATUS_BAR_HEIGHT+WIDGET_VERTI_MARGIN);
        make.left.mas_equalTo(self.view.mas_left).mas_offset(WIDGET_HORI_MARGIN);
        make.right.mas_equalTo(self.view.mas_right).mas_offset(-WIDGET_HORI_MARGIN);
        make.height.mas_equalTo(TEXTFIELD_HEIGHT);
    }];
    
    [txtvContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(txtfName.mas_bottom).mas_offset(WIDGET_COMMON_OFFSET);
        make.left.mas_equalTo(self.view.mas_left).mas_offset(WIDGET_HORI_MARGIN);
        make.right.mas_equalTo(self.view.mas_right).mas_offset(-WIDGET_HORI_MARGIN);
        make.height.mas_equalTo(TEXTFIELD_HEIGHT*2);
    }];
    
    [btnAdd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(txtvContent.mas_bottom).mas_offset(WIDGET_COMMON_OFFSET);
        make.left.mas_equalTo(self.view.mas_left).mas_offset(WIDGET_HORI_MARGIN);
        make.width.mas_equalTo(PIC_WIDTH);
        make.height.mas_equalTo(PIC_WIDTH);
    }];
    
    [btnSave mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(btnAdd.mas_bottom).mas_offset(WIDGET_COMMON_OFFSET);
        make.left.mas_equalTo(self.view.mas_left).mas_offset(WIDGET_HORI_MARGIN);
        make.right.mas_equalTo(self.view.mas_right).mas_offset(-WIDGET_HORI_MARGIN);
        make.height.mas_equalTo(BUTTON_HEIGHT);
    }];
}


#pragma mark - Actions
- (void)action_swipeLeft:(id)sender
{
    [self.navigationController.tabBarController setSelectedIndex:1];
}

@end
