
//
//  UINavigationBar+theme.m
//  XBThemeMaster
//
//  Created by chenxingbin on 2018/5/10.
//  Copyright © 2018年 chenxingbin. All rights reserved.
//

#import "UINavigationBar+theme.h"
#import <objc/runtime.h>

@interface UINavigationBar()
@property (nonatomic,strong) NSMutableDictionary<NSString *,XBColorAction> *actions;
@end

@implementation UINavigationBar (theme)

-(XBColorAction)xb_barTintColorAction{
    return objc_getAssociatedObject(self, @selector(xb_barTintColorAction));
}
-(void)xb_setBarTintColorAction:(XBColorAction)action{
    objc_setAssociatedObject(self, @selector(xb_barTintColorAction), action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.barTintColor = action(self.xb_manager.currentTheme);
    [self.actions setValue:[action copy] forKey:@"setBarTintColor:"];
}

-(XBColorAction)xb_tintColorAction{
    return objc_getAssociatedObject(self, @selector(xb_tintColorAction));
}

-(void)xb_setTintColorAction:(XBColorAction)action{
    objc_setAssociatedObject(self, @selector(xb_tintColorAction), action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.tintColor = action(self.xb_manager.currentTheme);
    [self.actions setValue:[action copy] forKey:@"setTintColor:"];
}


@end
