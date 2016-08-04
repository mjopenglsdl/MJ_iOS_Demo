//
//  DiscoverVC.m
//  MJ_iOS_Proj
//
//  Created by minjie on 03/08/16.
//  Copyright © 2016 minjie. All rights reserved.
//

#import "DiscoverVC.h"
#import "UIMacro.h"

#import "MomentCell.h"


@interface DiscoverVC()<UITableViewDelegate, UITableViewDataSource>

@end


@implementation DiscoverVC

-(instancetype)init{
    if (self=[super init]) {

    }
    return self;
}

-(void)viewDidLoad{
    self.view.backgroundColor=[UIColor grayColor];
    self.navigationItem.title=@"Discover";
    
    [self setupUI];
    
    // gesture
    UISwipeGestureRecognizer *swipeRight=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(action_swipeRight:)];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:swipeRight];
}


#pragma mark - UI
- (void)setupUI
{
    UITableView *tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-TAB_BAR_HEIGHT)];
    tableView.delegate=self;
    tableView.dataSource=self;
    
    [self.view addSubview:tableView];
}


#pragma mark - Delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID_Moment=@"cellID_Moment";
    MomentCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID_Moment];
    if (!cell) {
        cell=[[MomentCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID_Moment];
    }
    
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
