
//
//  UISlider+theme.m
//  XBThemeMaster
//
//  Created by chenxingbin on 2018/5/10.
//  Copyright © 2018年 chenxingbin. All rights reserved.
//

#import "UISlider+theme.h"
#import <objc/runtime.h>

@interface UISlider ()
@property (nonatomic,strong) NSMutableDictionary<NSString *,XBColorAction> *actions;
@end

@implementation UISlider (theme)

-(XBColorAction)xb_minimumTrackTintColorAction{
    return objc_getAssociatedObject(self, @selector(xb_minimumTrackTintColorAction));
}
-(void)xb_setMinimumTrackTintColorAction:(XBColorAction)action{
    objc_setAssociatedObject(self, @selector(xb_minimumTrackTintColorAction), action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.minimumTrackTintColor = action(self.xb_manager.currentTheme);
    [self.actions setValue:[action copy] forKey:@"setMinimumTrackTintColor:"];
}


-(XBColorAction)xb_maximumTrackTintColorAction{
    return objc_getAssociatedObject(self, @selector(xb_maximumTrackTintColorAction));
}


-(void)xb_setMaximumTrackTintColorAction:(XBColorAction)action{
    objc_setAssociatedObject(self, @selector(xb_maximumTrackTintColorAction), action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.maximumTrackTintColor = action(self.xb_manager.currentTheme);
    [self.actions setValue:[action copy] forKey:@"setMaximumTrackTintColor:"];
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
