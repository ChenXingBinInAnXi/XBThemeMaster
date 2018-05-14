
//
//  UILabel+theme.m
//  XBThemeMaster
//
//  Created by chenxingbin on 2018/5/10.
//  Copyright © 2018年 chenxingbin. All rights reserved.
//

#import "UILabel+theme.h"
#import <objc/runtime.h>


@interface UILabel ()
@property (nonatomic, strong) NSMutableDictionary<NSString *, XBColorAction> *actions;
@end

@implementation UILabel (theme)

-(XBColorAction)xb_textColorAction{
    return objc_getAssociatedObject(self, @selector(xb_textColorAction));
}
-(void)xb_setTextColorAction:(XBColorAction)action{
    objc_setAssociatedObject(self, @selector(xb_textColorAction), action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.textColor = action(self.xb_manager.currentTheme);
    [self.actions setValue:[action copy] forKey:@"setTextColor:"];
}


-(XBColorAction)xb_shadowColorAction{
    return objc_getAssociatedObject(self, @selector(xb_shadowColorAction));
}

-(void)xb_setShadowColorAction:(XBColorAction)action{
    objc_setAssociatedObject(self, @selector(xb_shadowColorAction), action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.shadowColor = action(self.xb_manager.currentTheme);
    [self.actions setValue:[action copy] forKey:@"setShadowColor:"];
}



-(XBColorAction)xb_highlightedTextColorAction{
    return objc_getAssociatedObject(self, @selector(xb_highlightedTextColorAction));
}

-(void)xb_setHighlightedTextColorAction:(XBColorAction)action{
    objc_setAssociatedObject(self, @selector(xb_highlightedTextColorAction), action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.highlightedTextColor = action(self.xb_manager.currentTheme);
    [self.actions setValue:[action copy] forKey:@"setHighlightedTextColor:"];
}

@end
