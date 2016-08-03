//
//  UIMacro.h
//  MJ_iOS_Proj
//
//  Created by minjie on 03/08/16.
//  Copyright © 2016 minjie. All rights reserved.
//

#ifndef UIMacro_h
#define UIMacro_h

// screen size
#define SCREEN_WIDTH     [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height

// status bar
#define STATUS_BAR_SIZE     [UIApplication sharedApplication].statusBarFrame.size
#define STATUS_BAR_WIDTH    MAX(STATUS_BAR_SIZE.height, STATUS_BAR_SIZE.width)
#define STATUS_BAR_HEIGHT   MIN(STATUS_BAR_SIZE.height, STATUS_BAR_SIZE.width)

// nav bar
#define NAV_BAR_SIZE     self.navigationController.navigationBar.frame.size
#define NAV_BAR_WIDTH    NAV_BAR_SIZE.width
#define NAV_BAR_HEIGHT  NAV_BAR_SIZE.height

// Top bar total height
#define NAV_AND_STATUS_BAR_HEIGHT (NAV_BAR_HEIGHT+STATUS_BAR_HEIGHT)

/// widgets dimensions
#define WIDGET_COMMON_OFFSET (SCREEN_HEIGHT*0.1)
#define WIDGET_HORI_MARGIN 20.0f

#define TEXTFIELD_HEIGHT 34.0f
#define BUTTON_HEIGHT 40.0f


#endif /* UIMacro_h */
