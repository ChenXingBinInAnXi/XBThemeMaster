

//
//  UITableView+theme.m
//  XBThemeMaster
//
//  Created by chenxingbin on 2018/5/10.
//  Copyright © 2018年 chenxingbin. All rights reserved.
//

#import "UITableView+theme.h"
#import <objc/runtime.h>

@interface UITableView ()
@property (nonatomic,strong) NSMutableDictionary<NSString *,XBColorAction> *actions;
@end

@implementation UITableView (theme)

-(XBColorAction)xb_separatorColorAction{
    return objc_getAssociatedObject(self, @selector(xb_separatorColorAction));
}

-(void)xb_setSeparatorColorAction:(XBColorAction)action{
    objc_setAssociatedObject(self, @selector(xb_separatorColorAction), action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.separatorColor = action(self.xb_manager.currentTheme);
    [self.actions setValue:[action copy] forKey:@"setSeparatorColor:"];
}


-(XBColorAction)xb_sectionIndexColorAction{
    return objc_getAssociatedObject(self, @selector(xb_sectionIndexColorAction));
}
-(void)xb_setSectionIndexColorAction:(XBColorAction)action{
    objc_setAssociatedObject(self, @selector(xb_sectionIndexColorAction), action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.sectionIndexColor = action(self.xb_manager.currentTheme);
    [self.actions setValue:[action copy] forKey:@"setSectionIndexColor:"];
}



-(XBColorAction)xb_sectionIndexBackgroundColorAction{
    return objc_getAssociatedObject(self, @selector(xb_sectionIndexBackgroundColorAction));
}
-(void)xb_setSectionIndexBackgroundColorAction:(XBColorAction)action{
    objc_setAssociatedObject(self, @selector(xb_sectionIndexBackgroundColorAction), action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.sectionIndexBackgroundColor = action(self.xb_manager.currentTheme);
    [self.actions setValue:[action copy] forKey:@"setSectionIndexBackgroundColor:"];
}


-(XBColorAction)xb_sectionIndexTrackingBackgroundColorAction{
   return  objc_getAssociatedObject(self, @selector(xb_sectionIndexTrackingBackgroundColorAction));
}
-(void)xb_setSectionIndexTrackingBackgroundColorAction:(XBColorAction)action{
    objc_setAssociatedObject(self, @selector(xb_sectionIndexTrackingBackgroundColorAction), action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.sectionIndexTrackingBackgroundColor = action(self.xb_manager.currentTheme);
    [self.actions setValue:[action copy] forKey:@"setSectionIndexTrackingBackgroundColor:"];
}
@end
