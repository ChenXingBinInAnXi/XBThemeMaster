//
//  UIView+theme.h
//  XBThemeMaster
//
//  Created by chenxingbin on 2018/5/9.
//  Copyright © 2018年 chenxingbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+theme.h"

@interface UIView (theme)

@property (nonatomic,copy,setter=xb_setBackgroundColorAction:) XBColorAction xb_backgroundColorAction;

@property (nonatomic,copy,setter=xb_setTintColorAction:) XBColorAction xb_tintColorAction;


@end
