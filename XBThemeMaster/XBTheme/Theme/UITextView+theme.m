
//
//  UITextView+theme.m
//  XBThemeMaster
//
//  Created by chenxingbin on 2018/5/10.
//  Copyright © 2018年 chenxingbin. All rights reserved.
//

#import "UITextView+theme.h"
#import <objc/runtime.h>

@interface UITextView()
@property (nonatomic,strong) NSMutableDictionary<NSString *,XBColorAction> *actions;
@end

@implementation UITextView (theme)

-(XBColorAction)xb_textColorAction{
    return objc_getAssociatedObject(self, @selector(xb_textColorAction));
}

-(void)xb_setTextColorAction:(XBColorAction)action{
    objc_setAssociatedObject(self, @selector(xb_textColorAction), action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.textColor = action(self.xb_manager.currentTheme);
    [self.actions setValue:[action copy] forKey:@"setTextColor:"];
}


@end
