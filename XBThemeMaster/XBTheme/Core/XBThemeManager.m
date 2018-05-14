
//
//  XBThemeManager.m
//  XBTheme
//
//  Created by chenxingbin on 2018/5/10.
//  Copyright © 2018年 chenxingbin. All rights reserved.
//

#import "XBThemeManager.h"




//

static NSString *const XBCurrentThemeKey = @"com.xbtheme.manager.theme";




@implementation XBThemeManager

+(XBThemeManager *)sharedManager{
    static dispatch_once_t once;
    static XBThemeManager *instance;
    dispatch_once(&once, ^{
        instance = [[self alloc] init];
        instance.supportsKeyboard = YES;
        instance.changeStatusBar = YES;
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        XBTheme *currentTheme = [userDefaults valueForKey:XBCurrentThemeKey];
        instance.currentTheme = currentTheme;
    });
    return instance;
}





-(void)nightTheme{
    self.currentTheme = XBThemeNight;
}
-(void)normalTheme{
    self.currentTheme = XBThemeNormal;
}



-(void)setCurrentTheme:(XBTheme *)currentTheme{
    if ([_currentTheme isEqualToString:currentTheme]) return;
    _currentTheme = currentTheme;
    
    [[NSUserDefaults standardUserDefaults] setValue:currentTheme forKey:XBCurrentThemeKey];
    [[NSNotificationCenter defaultCenter] postNotificationName:XBThemeChangingNotification object:nil];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    if (self.shouldChangeStatusBar) {
        if ([currentTheme isEqualToString:XBThemeNight]) {
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        }else{
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
        }
#pragma clang diagnostic pop
    }
}



@end
