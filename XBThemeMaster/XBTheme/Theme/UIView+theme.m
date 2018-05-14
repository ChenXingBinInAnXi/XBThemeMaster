
//
//  UIView+theme.m
//  XBThemeMaster
//
//  Created by chenxingbin on 2018/5/9.
//  Copyright © 2018年 chenxingbin. All rights reserved.
//

#import "UIView+theme.h"
#import <objc/runtime.h>


@interface UIView ()
@property (nonatomic,strong) NSMutableDictionary<NSString *,XBColorAction> *actions;
@end

@implementation UIView (theme)

-(XBColorAction)xb_backgroundColorAction{
    return objc_getAssociatedObject(self, @selector(xb_backgroundColorAction));
}

-(void)xb_setBackgroundColorAction:(XBColorAction)action{
    objc_setAssociatedObject(self, @selector(xb_backgroundColorAction), action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.backgroundColor = action(self.xb_manager.currentTheme);
    [self.actions setValue:[action copy] forKey:@"setBackgroundColor:"];
}


- (XBColorAction)xb_tintColorAction{
    return objc_getAssociatedObject(self, @selector(xb_tintColorAction));
}


-(void)xb_setTintColorAction:(XBColorAction)action{
    objc_setAssociatedObject(self, @selector(xb_tintColorAction), action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.tintColor = action(self.xb_manager.currentTheme);
    [self.actions setValue:[action copy] forKey:@"setTintColor:"];
}


@end
