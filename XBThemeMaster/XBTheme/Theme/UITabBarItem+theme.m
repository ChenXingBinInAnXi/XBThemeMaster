
//
//  UITabBarItem+theme.m
//  XBThemeMaster
//
//  Created by chenxingbin on 2018/5/11.
//  Copyright © 2018年 chenxingbin. All rights reserved.
//

#import "UITabBarItem+theme.h"
#import <objc/runtime.h>
#import <objc/message.h>

@interface UITabBarItem()
@property (nonatomic,strong) NSMutableDictionary<NSString *,id> *actions;
@end

@implementation UITabBarItem (theme)


-(XBImageAction)xb_imageAction{
    return objc_getAssociatedObject(self, @selector(xb_imageAction));
}

-(void)xb_setImageAction:(XBImageAction)action{
    objc_setAssociatedObject(self, @selector(xb_imageAction), action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.image = action(self.xb_manager.currentTheme);
    [self.actions setValue:[action copy] forKey:@"setImage:"];
}





-(XBImageAction)xb_selectedImageAction{
    return objc_getAssociatedObject(self, @selector(xb_selectedImageAction));
}

-(void)xb_setSelectedImageAction:(XBImageAction)action{
    objc_setAssociatedObject(self, @selector(xb_selectedImageAction), action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.selectedImage = action(self.xb_manager.currentTheme);
    [self.actions setValue:[action copy] forKey:@"setSelectedImage:"];
}











-(void)xb_setTitleTextAttributes:(XBAttributesAction)action forState:(UIControlState)state{
    [self setTitleTextAttributes:action(self.xb_manager.currentTheme) forState:state];
    NSString *key = [NSString stringWithFormat:@"%@",@(state)];
    NSMutableDictionary *dictionary = [self.actions valueForKey:key];
    if (dictionary == nil) {
        dictionary = [[NSMutableDictionary alloc] init];
    }
    [dictionary setValue:[action copy] forKey:NSStringFromSelector(@selector(setTitleTextAttributes:forState:))];
    [self.actions setValue:dictionary forKey:key];
}



-(void)themeChange{
    [self.actions enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[NSDictionary class]]) {
            NSDictionary<NSString *, XBAttributesAction> *dictionary = (NSDictionary *)obj;
            [dictionary enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull selector, XBAttributesAction  _Nonnull picker, BOOL * _Nonnull stop) {
                UIControlState state = [key integerValue];
                if ([selector isEqualToString:NSStringFromSelector(@selector(setTitleTextAttributes:forState:))]) {
                    NSDictionary *resultDict = picker(self.xb_manager.currentTheme);
                    [self setTitleTextAttributes:resultDict forState:state];
                }
                
            }];
        }else if([key isEqualToString:@"setImage:"] || [key isEqualToString:@"setSelectedImage:"]){
            SEL sel = NSSelectorFromString(key);
            id result = ((XBImageAction)obj)(self.xb_manager.currentTheme);
            [self performSelector:sel withObject:result];
//            [UIView animateWithDuration:XBThemeAnimationDuration animations:^{
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
//                 [self performSelector:sel withObject:result];
//#pragma clang diagnostic pop
//            }];
        }else {
            SEL sel = NSSelectorFromString(key);
            XBColorAction picker = (XBColorAction)obj;
            UIColor *resultColor = picker(self.xb_manager.currentTheme);
            [UIView animateWithDuration:XBThemeAnimationDuration
                             animations:^{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
                                 [self performSelector:sel withObject:resultColor];
#pragma clang diagnostic pop
                             }];
            
        }
    }];
}




@end
