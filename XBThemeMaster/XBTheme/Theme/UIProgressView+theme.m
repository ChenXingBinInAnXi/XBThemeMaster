
//
//  UIProgressView+theme.m
//  XBThemeMaster
//
//  Created by chenxingbin on 2018/5/10.
//  Copyright © 2018年 chenxingbin. All rights reserved.
//

#import "UIProgressView+theme.h"
#import <objc/runtime.h>

@interface UIProgressView()
@property (nonatomic,strong) NSMutableDictionary<NSString *,XBColorAction> *actions;
@end

@implementation UIProgressView (theme)

-(XBColorAction)xb_progressTintColorAction{
    return objc_getAssociatedObject(self, @selector(xb_progressTintColorAction));
}

-(void)xb_setProgressTintColorAction:(XBColorAction)action{
    objc_setAssociatedObject(self, @selector(xb_progressTintColorAction), action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.progressTintColor = action(self.xb_manager.currentTheme);
    [self.actions setValue:[action copy] forKey:@"setProgressTintColor:"];
}

-(XBColorAction)xb_trackTintColorAction{
    return objc_getAssociatedObject(self, @selector(xb_trackTintColorAction));
}
-(void)xb_setTrackTintColorAction:(XBColorAction)action{
    objc_setAssociatedObject(self, @selector(xb_trackTintColorAction), action,OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.trackTintColor = action(self.xb_manager.currentTheme);
    [self.actions setValue:[action copy] forKey:@"setTrackTintColor:"];
}


@end
