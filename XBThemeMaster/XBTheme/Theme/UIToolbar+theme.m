
//
//  UIToolbar+theme.m
//  XBThemeMaster
//
//  Created by chenxingbin on 2018/5/10.
//  Copyright © 2018年 chenxingbin. All rights reserved.
//

#import "UIToolbar+theme.h"
#import <objc/runtime.h>

@interface UIToolbar()
@property (nonatomic,strong) NSMutableDictionary<NSString *,XBColorAction> *actions;
@end

@implementation UIToolbar (theme)


-(XBColorAction)xb_barTintColorAction{
    return objc_getAssociatedObject(self, @selector(xb_barTintColorAction));
}

-(void)xb_setBarTintColorAction:(XBColorAction)action{
    objc_setAssociatedObject(self, @selector(xb_barTintColorAction), action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.tintColor = action(self.xb_manager.currentTheme);
    [self.actions setValue:[action copy] forKey:@"setTintColor:"];
}

@end
