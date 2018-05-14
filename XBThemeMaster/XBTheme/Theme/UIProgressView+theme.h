//
//  UIProgressView+theme.h
//  XBThemeMaster
//
//  Created by chenxingbin on 2018/5/10.
//  Copyright © 2018年 chenxingbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+theme.h"

@interface UIProgressView (theme)

@property (nonatomic,copy,setter=xb_setProgressTintColorAction:) XBColorAction xb_progressTintColorAction;
@property (nonatomic,copy,setter=xb_setTrackTintColorAction:) XBColorAction xb_trackTintColorAction;



@end
