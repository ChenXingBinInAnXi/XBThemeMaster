//
//  UIPageControl+theme.h
//  XBThemeMaster
//
//  Created by chenxingbin on 2018/5/10.
//  Copyright © 2018年 chenxingbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+theme.h"

@interface UIPageControl (theme)

@property (nonatomic,copy,setter=xb_setPageIndicatorTintColorAction:) XBColorAction xb_pageIndicatorTintColorAction;
@property (nonatomic,copy,setter=xb_setCurrentPageIndicatorTintColorAction:) XBColorAction xb_currentPageIndicatorTintColorAction;



@end
