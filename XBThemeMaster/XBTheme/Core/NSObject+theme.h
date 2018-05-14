//
//  NSObject+theme.h
//  XBThemeMaster
//
//  Created by chenxingbin on 2018/5/9.
//  Copyright © 2018年 chenxingbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XBThemeManager.h"

@interface NSObject (theme)


@property (nonatomic,strong,readonly) XBThemeManager *xb_manager;


-(void)themeDidChange:(XBTheme *)theme;


@end
