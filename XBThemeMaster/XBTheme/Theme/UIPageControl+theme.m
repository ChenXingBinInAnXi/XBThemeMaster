
//
//  UIPageControl+theme.m
//  XBThemeMaster
//
//  Created by chenxingbin on 2018/5/10.
//  Copyright © 2018年 chenxingbin. All rights reserved.
//

#import "UIPageControl+theme.h"
#import <objc/runtime.h>

@interface UIPageControl ()
@property (nonatomic,strong) NSMutableDictionary<NSString *,XBColorAction> *actions;
@end

@implementation UIPageControl (theme)

-(XBColorAction)xb_pageIndicatorTintColorAction{
    return objc_getAssociatedObject(self, @selector(xb_pageIndicatorTintColorAction));
}

-(void)xb_setPageIndicatorTintColorAction:(XBColorAction)action{
    objc_setAssociatedObject(self, @selector(xb_pageIndicatorTintColorAction), action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.pageIndicatorTintColor = action(self.xb_manager.currentTheme);
    [self.actions setValue:[action copy] forKey:@"setPageIndicatorTintColor:"];
}


-(XBColorAction)xb_currentPageIndicatorTintColorAction{
    return objc_getAssociatedObject(self, @selector(xb_currentPageIndicatorTintColorAction));
}

-(void)xb_setCurrentPageIndicatorTintColorAction:(XBColorAction)action{
    objc_setAssociatedObject(self, @selector(xb_currentPageIndicatorTintColorAction), action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.currentPageIndicatorTintColor = action(self.xb_manager.currentTheme);
    [self.actions setValue:[action copy] forKey:@"setCurrentPageIndicatorTintColor:"];
}

@end
