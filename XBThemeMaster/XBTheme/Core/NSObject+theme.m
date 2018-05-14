//
//  NSObject+theme.m
//  XBThemeMaster
//
//  Created by chenxingbin on 2018/5/9.
//  Copyright © 2018年 chenxingbin. All rights reserved.
//

#import "NSObject+theme.h"
#import <objc/runtime.h>
#import "NSObject+DeallocBlock.h"

@interface NSObject()
@property (nonatomic,strong) NSMutableDictionary<NSString *,XBColorAction> *actions;
@end

@implementation NSObject (theme)

- (XBThemeManager *)xb_manager{
    return [XBThemeManager sharedManager];
}

static void *XBViewDeallocHelperKey;
-(NSMutableDictionary<NSString *,XBColorAction> *)actions{
    NSMutableDictionary<NSString *,XBColorAction> *actions = objc_getAssociatedObject(self, @selector(actions));
    if (actions == nil) {
       
        @autoreleasepool{
            if (objc_getAssociatedObject(self, &XBViewDeallocHelperKey) == nil){
                __unsafe_unretained typeof(self) weakself = self;
                id deallocHelper = [self addDeallocBlock:^{
                    [[NSNotificationCenter defaultCenter] removeObserver:weakself];
                    
                }];
                objc_setAssociatedObject(self, &XBViewDeallocHelperKey, deallocHelper, OBJC_ASSOCIATION_ASSIGN);
            }
        }
        
        actions = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, @selector(actions), actions, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        [[NSNotificationCenter defaultCenter] removeObserver:self name:XBThemeChangingNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeChange) name:XBThemeChangingNotification object:nil];
    }
    return actions;
}



-(void)themeChange{
    [self.actions enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull selector, XBColorAction  _Nonnull colorAction, BOOL * _Nonnull stop) {
        SEL sel = NSSelectorFromString(selector);
        id result = colorAction(self.xb_manager.currentTheme);
        [UIView animateWithDuration:XBThemeAnimationDuration animations:^{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [self performSelector:sel withObject:result];
#pragma clang diagnostic pop
        }];
    }];
}


@end
