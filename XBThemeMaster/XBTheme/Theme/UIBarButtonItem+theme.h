//
//  UIBarButtonItem+theme.h
//  XBThemeMaster
//
//  Created by chenxingbin on 2018/5/10.
//  Copyright © 2018年 chenxingbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+theme.h"

@interface UIBarButtonItem (theme)

@property (nonatomic,copy,setter=xb_setTintColorAction:) XBColorAction xb_tintColorAction;


@end
