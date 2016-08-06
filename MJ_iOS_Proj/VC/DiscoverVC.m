//
//  DiscoverVC.m
//  MJ_iOS_Proj
//
//  Created by minjie on 03/08/16.
//  Copyright © 2016 minjie. All rights reserved.
//

#import "DiscoverVC.h"
#import "UIMacro.h"
#import "FontHeightManager.h"
#import "MomentDBService.h"

#import "MomentCell.h"


@interface DiscoverVC()<UITableViewDelegate, UITableViewDataSource>
@property(strong, nonatomic) NSArray *aryMomentModels;
@property(assign, nonatomic) NSInteger cellHeight;
@end


@implementation DiscoverVC

-(instancetype)init{
    if (self=[super init]) {
        _cellHeight=WIDGET_VERTI_MARGIN*2+fontHeight_14+fontHeight_14+MOMENTCELL_VERTI_OFFSET*2+ PIC_OFFSET*2+THUMB_PIC_WIDTH*3;
    }
    return self;
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor grayColor];
    self.navigationItem.title=@"Discover";
    
    [self setupData];
    [self setupUI];
    
    // gesture
    UISwipeGestureRecognizer *swipeRight=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(action_swipeRight:)];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:swipeRight];
}


#pragma mark - Data
- (void)setupData
{
    _aryMomentModels=[[MomentDBService sharedService]queryRecordWithCount:15];
}


#pragma mark - UI
- (void)setupUI
{
    UITableView *tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-TAB_BAR_HEIGHT)];
    tableView.delegate=self;
    tableView.dataSource=self;
    [tableView registerClass:[MomentCell class] forCellReuseIdentifier:NSStringFromClass([MomentCell class])];
    
    [self.view addSubview:tableView];
}


#pragma mark - Delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _aryMomentModels.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _cellHeight;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MomentCell *cell=[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MomentCell class]) forIndexPath:indexPath];
    MomentModel *model=(MomentModel *)_aryMomentModels[indexPath.row];
    cell.lblName.text= model.strName;
    cell.lblContent.text=model.strContent;
    [cell setupCollectionViewWithUrlArray:model.aryAssetUrls];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //
}


#pragma mark - Actions
- (void)action_swipeRight:(id)sender
{
    [self.navigationController.tabBarController setSelectedIndex:0];
}


@end
