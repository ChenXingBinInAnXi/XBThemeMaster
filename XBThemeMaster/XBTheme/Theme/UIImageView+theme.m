//
//  UIImageView+theme.m
//  XBThemeMaster
//
//  Created by chenxingbin on 2018/5/10.
//  Copyright © 2018年 chenxingbin. All rights reserved.
//

#import "UIImageView+theme.h"
#import <objc/runtime.h>
#import <objc/message.h>

@interface UIImageView()
@property (nonatomic,strong) NSMutableDictionary<NSString *,id> *actions;
@end

@implementation UIImageView (theme)

-(XBImageAction)xb_imageAction{
    return objc_getAssociatedObject(self, @selector(xb_imageAction));
}

-(void)xb_setImageAction:(XBImageAction)action{
    objc_setAssociatedObject(self, @selector(xb_imageAction), action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.image = action(self.xb_manager.currentTheme);
    [self.actions setValue:[action copy] forKey:@"setImage:"];
}


-(XBAlphaAction)xb_alphaAction{
    return objc_getAssociatedObject(self, @selector(xb_alphaAction));
}

-(void)xb_setAlphaAction:(XBAlphaAction)action{
    objc_setAssociatedObject(self, @selector(xb_alphaAction), action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.alpha = action(self.xb_manager.currentTheme);
    [self.actions setValue:[action copy] forKey:@"setAlpha:"];
}

-(void)themeChange{

    [self.actions enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {

        if ([key isEqualToString:@"setAlpha:"]) {
            XBAlphaAction alphaAction = (XBAlphaAction)obj;
            CGFloat alpha = alphaAction(self.xb_manager.currentTheme);
            [UIView animateWithDuration:XBThemeAnimationDuration
                             animations:^{
                                 ((void (*)(id, SEL, CGFloat))objc_msgSend)(self, NSSelectorFromString(key), alpha);
                             }];
        }else if([key isEqualToString:@"setImage:"]){
                 SEL sel = NSSelectorFromString(key);
                 id result = ((XBImageAction)obj)(self.xb_manager.currentTheme);
                    [UIView animateWithDuration:XBThemeAnimationDuration animations:^{
            #pragma clang diagnostic push
            #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
                        [self performSelector:sel withObject:result];
            #pragma clang diagnostic pop
                    }];
        }else{
            SEL sel = NSSelectorFromString(key);
            id result = ((XBColorAction)obj)(self.xb_manager.currentTheme);
            [UIView animateWithDuration:XBThemeAnimationDuration animations:^{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
                [self performSelector:sel withObject:result];
#pragma clang diagnostic pop
            }];
        }

    }];
}


@end
