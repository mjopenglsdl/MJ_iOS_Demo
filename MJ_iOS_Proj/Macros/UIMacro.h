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

// tab bar
#define TAB_BAR_HEIGHT 49.0f


/// widgets dimensions
#define WIDGET_COMMON_OFFSET 30.0f

#define WIDGET_HORI_MARGIN 20.0f
#define WIDGET_VERTI_MARGIN 24.0f


#define TEXTFIELD_HEIGHT 34.0f
#define BUTTON_HEIGHT 40.0f

#define THUMB_WIDTH 70.0f
#define PIC_WIDTH 100.0f

#define COLLECTION_ITEM_VERTI_DIST 20.0f
#define COLLECTION_ITEM_HORI_DIST 20.0f


/// fonts
#define fontHeight_12 ([FontHeightManager sharedManager].fontHeightOf12)
#define fontHeight_13 ([FontHeightManager sharedManager].fontHeightOf13)
#define fontHeight_14 ([FontHeightManager sharedManager].fontHeightOf14)
#define fontHeight_15 ([FontHeightManager sharedManager].fontHeightOf15)
#define fontHeight_16 ([FontHeightManager sharedManager].fontHeightOf16)

#define Font_Size12 [UIFont systemFontOfSize:12.0f]
#define Font_Size13 [UIFont systemFontOfSize:13.0f]
#define Font_Size14 [UIFont systemFontOfSize:14.0f]
#define Font_Size15 [UIFont systemFontOfSize:15.0f]
#define Font_Size16 [UIFont systemFontOfSize:16.0f]

/// generated code
// resign all first responders in current VC
#define GEN_ResignAllResponders \
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{\
[self.view resignAllFirstResponder];\
[super touchesBegan:touches withEvent:event];\
}


#endif /* UIMacro_h */
