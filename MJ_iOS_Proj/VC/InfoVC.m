//
//  InfoVC.m
//  MJ_iOS_Proj
//
//  Created by minjie on 03/08/16.
//  Copyright © 2016 minjie. All rights reserved.
//

#import "InfoVC.h"
#import "UITextField+Util.h"
#import "Masonry.h"
#import "UIMacro.h"


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
    
    UITextField *txtFieldName=[[UITextField alloc]initWithPlaceHolder:@"Your Name"];
    [txtFieldName mas_makeConstraints:^(MASConstraintMaker *make) {
        ;
    }];

    // gesture
    UISwipeGestureRecognizer *swipeLeft=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(action_swipeLeft:)];
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:swipeLeft];
    
}


#pragma mark - Actions
- (void)action_swipeLeft:(id)sender
{
    [self.navigationController.tabBarController setSelectedIndex:1];
}

@end
