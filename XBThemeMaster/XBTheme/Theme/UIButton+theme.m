
//
//  UIButton+theme.m
//  XBThemeMaster
//
//  Created by chenxingbin on 2018/5/10.
//  Copyright © 2018年 chenxingbin. All rights reserved.
//

#import "UIButton+theme.h"

@interface UIButton ()
@property (nonatomic,strong) NSMutableDictionary<NSString *,id> *actions;
@end

@implementation UIButton (theme)

-(void)xb_setTitleColorAction:(XBColorAction)action forState:(UIControlState)state{
    [self setTitleColor:action(self.xb_manager.currentTheme) forState:state];
    NSString *key = [NSString stringWithFormat:@"%@",@(state)];
    NSMutableDictionary *dictionary = [self.actions valueForKey:key];
    if (dictionary == nil) {
        dictionary = [[NSMutableDictionary alloc] init];
    }
    [dictionary setValue:[action copy] forKey:NSStringFromSelector(@selector(setTitleColor:forState:))];
    [self.actions setValue:dictionary forKey:key];
}

-(void)xb_setBackgroundImage:(XBImageAction)action forState:(UIControlState)state{
    [self setBackgroundImage:action(self.xb_manager.currentTheme) forState:state];
    NSString *key = [NSString stringWithFormat:@"%@",@(state)];
    NSMutableDictionary *dictionary = [self.actions valueForKey:key];
    if (dictionary == nil) {
        dictionary = [[NSMutableDictionary alloc] init];
    }
    [dictionary setValue:[action copy] forKey:NSStringFromSelector(@selector(setBackgroundImage:forState:))];
    [self.actions setValue:dictionary forKey:key];
    
}

-(void)xb_setImage:(XBImageAction)action forState:(UIControlState)state{
    [self setImage:action(self.xb_manager.currentTheme) forState:state];
    NSString *key = [NSString stringWithFormat:@"%@",@(state)];
    NSMutableDictionary *dictionary = [self.actions valueForKey:key];
    if (dictionary == nil) {
        dictionary = [[NSMutableDictionary alloc] init];
    }
    [dictionary setValue:[action copy] forKey:NSStringFromSelector(@selector(setImage:forState:))];
    [self.actions setValue:dictionary forKey:key];
}

-(void)themeChange{
    [self.actions enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[NSDictionary class]]) {
            NSDictionary<NSString *, XBColorAction> *dictionary = (NSDictionary *)obj;
            [dictionary enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull selector, XBColorAction  _Nonnull picker, BOOL * _Nonnull stop) {
                UIControlState state = [key integerValue];
                [UIView animateWithDuration:XBThemeAnimationDuration
                                 animations:^{
                                     if ([selector isEqualToString:NSStringFromSelector(@selector(setTitleColor:forState:))]) {
                                         UIColor *resultColor = picker(self.xb_manager.currentTheme);
                                         [self setTitleColor:resultColor forState:state];
                                     } else if ([selector isEqualToString:NSStringFromSelector(@selector(setBackgroundImage:forState:))]) {
                                         UIImage *resultImage = ((XBImageAction)picker)(self.xb_manager.currentTheme);
                                         [self setBackgroundImage:resultImage forState:state];
                                     } else if ([selector isEqualToString:NSStringFromSelector(@selector(setImage:forState:))]) {
                                         UIImage *resultImage = ((XBImageAction)picker)(self.xb_manager.currentTheme);
                                         [self setImage:resultImage forState:state];
                                     }
                                 }];
            }];
        } else {
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
