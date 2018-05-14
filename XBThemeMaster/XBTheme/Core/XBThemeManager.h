//
//  XBThemeManager.h
//  XBTheme
//
//  Created by chenxingbin on 2018/5/10.
//  Copyright © 2018年 chenxingbin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NSString XBTheme;

static XBTheme *const XBThemeNormal = @"NORMAL";
static XBTheme *const XBThemeNight = @"NIGHT";

static NSString *const XBThemeChangingNotification = @"XBThemeChangingNotification";
static CGFloat const XBThemeAnimationDuration = 0.3;


typedef UIColor *(^XBColorAction)(XBTheme *theme);
typedef UIImage *(^XBImageAction)(XBTheme *theme);
typedef CGFloat (^XBAlphaAction)(XBTheme *theme);
typedef NSDictionary *(^XBAttributesAction)(XBTheme *theme);









@interface XBThemeManager : NSObject
@property (nonatomic,strong) XBTheme *currentTheme;
//是否支持状态栏
//还要在plist文件里添加一个字段  key： View controller-based status bar appearance  value：NO
@property (nonatomic,assign,getter=shouldChangeStatusBar) BOOL changeStatusBar;
//是否支持键盘
@property (nonatomic,assign) BOOL supportsKeyboard;




+(XBThemeManager *)sharedManager;
-(void)nightTheme;
-(void)normalTheme;



@end
