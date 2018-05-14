//
//  UIButton+theme.h
//  XBThemeMaster
//
//  Created by chenxingbin on 2018/5/10.
//  Copyright © 2018年 chenxingbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+theme.h"

@interface UIButton (theme)

-(void)xb_setTitleColorAction:(XBColorAction)action forState:(UIControlState)state;

-(void)xb_setBackgroundImage:(XBImageAction)action forState:(UIControlState)state;

-(void)xb_setImage:(XBImageAction)action forState:(UIControlState)state;

@end
