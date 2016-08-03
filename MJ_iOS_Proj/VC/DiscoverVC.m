//
//  DiscoverVC.m
//  MJ_iOS_Proj
//
//  Created by minjie on 03/08/16.
//  Copyright © 2016 minjie. All rights reserved.
//

#import "DiscoverVC.h"

@implementation DiscoverVC

-(instancetype)init{
    if (self=[super init]) {

    }
    return self;
}

-(void)viewDidLoad{
    self.view.backgroundColor=[UIColor grayColor];
    self.navigationItem.title=@"Discover";
    
    // gesture
    UISwipeGestureRecognizer *swipeRight=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(action_swipeRight:)];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:swipeRight];
}


#pragma mark - Actions
- (void)action_swipeRight:(id)sender
{
    [self.navigationController.tabBarController setSelectedIndex:0];
}


@end
