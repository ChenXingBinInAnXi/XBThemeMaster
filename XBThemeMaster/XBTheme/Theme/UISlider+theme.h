//
//  UISlider+theme.h
//  XBThemeMaster
//
//  Created by chenxingbin on 2018/5/10.
//  Copyright © 2018年 chenxingbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+theme.h"

@interface UISlider (theme)

@property (nonatomic,copy,setter=xb_setMinimumTrackTintColorAction:) XBColorAction xb_minimumTrackTintColorAction;
@property (nonatomic,copy,setter=xb_setMaximumTrackTintColorAction:) XBColorAction xb_maximumTrackTintColorAction;
@property (nonatomic,copy,setter=xb_setThumbTintColorAction:) XBColorAction xb_thumbTintColorAction;




@end
