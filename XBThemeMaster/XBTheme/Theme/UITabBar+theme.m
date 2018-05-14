
//
//  UITabBar+theme.m
//  XBThemeMaster
//
//  Created by chenxingbin on 2018/5/10.
//  Copyright © 2018年 chenxingbin. All rights reserved.
//

#import "UITabBar+theme.h"
#import <objc/runtime.h>

@interface UITabBar ()
@property (nonatomic,strong) NSMutableDictionary<NSString *,XBColorAction> *actions;
@end

@implementation UITabBar (theme)

-(XBColorAction)xb_barTintColorAction{
    return objc_getAssociatedObject(self, @selector(xb_barTintColorAction));
}

-(void)xb_setBarTintColorAction:(XBColorAction)action{
    objc_setAssociatedObject(self, @selector(xb_barTintColorAction), action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.barTintColor = action(self.xb_manager.currentTheme);
    [self.actions setValue:[action copy] forKey:@"setBarTintColor:"];
    
}

@end
