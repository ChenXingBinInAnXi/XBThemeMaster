
//
//  UITextView+Keyboard.m
//  XBThemeMaster
//
//  Created by chenxingbin on 2018/5/10.
//  Copyright © 2018年 chenxingbin. All rights reserved.
//

#import "UITextView+Keyboard.h"
#import "NSObject+theme.h"
#import <objc/runtime.h>


@interface NSObject ()
- (void)themeChange;
@end

@implementation UITextView (Keyboard)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(init);
        SEL swizzledSelector = @selector(xb_init);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
    
}

- (instancetype)xb_init {
    UITextView *obj = [self xb_init];
    if (self.xb_manager.supportsKeyboard && [self.xb_manager.currentTheme isEqualToString:XBThemeNight]) {
#ifdef __IPHONE_7_0
        obj.keyboardAppearance = UIKeyboardAppearanceDark;
#else
        obj.keyboardAppearance = UIKeyboardAppearanceAlert;
#endif
    } else {
        obj.keyboardAppearance = UIKeyboardAppearanceDefault;
    }
    return obj;
}

-(void)themeChange{
    [super themeChange];
    if (self.xb_manager.supportsKeyboard && [self.xb_manager.currentTheme isEqualToString:XBThemeNight]) {
#ifdef __IPHONE_7_0
        self.keyboardAppearance = UIKeyboardAppearanceDark;
#else
        self.keyboardAppearance = UIKeyboardAppearanceAlert;
#endif
    } else {
        self.keyboardAppearance = UIKeyboardAppearanceDefault;
    }
}
@end
