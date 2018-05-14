//
//  UISwitch+theme.h
//  XBThemeMaster
//
//  Created by chenxingbin on 2018/5/10.
//  Copyright © 2018年 chenxingbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+theme.h"

@interface UISwitch (theme)

@property (nonatomic,copy,setter=xb_setOnTintColorAction:) XBColorAction xb_onTintColorAction;

@property (nonatomic,copy,setter=xb_setThumbTintColorAction:) XBColorAction xb_thumbTintColorAction;



@end
