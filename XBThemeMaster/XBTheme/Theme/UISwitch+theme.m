
//
//  UISwitch+theme.m
//  XBThemeMaster
//
//  Created by chenxingbin on 2018/5/10.
//  Copyright © 2018年 chenxingbin. All rights reserved.
//

#import "UISwitch+theme.h"
#import <objc/runtime.h>


@interface UISwitch ()
@property (nonatomic,strong) NSMutableDictionary<NSString *,XBColorAction> *actions;
@end

@implementation UISwitch (theme)

-(XBColorAction)xb_onTintColorAction{
    return objc_getAssociatedObject(self, @selector(xb_onTintColorAction));
}
-(void)xb_setOnTintColorAction:(XBColorAction)action{
    objc_setAssociatedObject(self, @selector(xb_onTintColorAction), action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.onTintColor = action(self.xb_manager.currentTheme);
    [self.actions setValue:[action copy] forKey:@"setTintColor:"];
}

-(XBColorAction)xb_thumbTintColorAction{
    return objc_getAssociatedObject(self, @selector(xb_thumbTintColorAction));
}

-(void)xb_setThumbTintColorAction:(XBColorAction)action{
    objc_setAssociatedObject(self, @selector(xb_thumbTintColorAction), action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.thumbTintColor = action(self.xb_manager.currentTheme);
    [self.actions setValue:[action copy] forKey:@"setThumbTintColor:"];
    
}

@end
