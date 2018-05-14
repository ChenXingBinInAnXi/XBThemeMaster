//
//  XBNavigationController.m
//  XBThemeMaster
//
//  Created by chenxingbin on 2018/5/10.
//  Copyright © 2018年 chenxingbin. All rights reserved.
//

#import "XBNavigationController.h"
#import "XBTheme.h"
#import "UIColor+Hex.h"

@interface XBNavigationController ()

@end

@implementation XBNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //背景
    self.navigationBar.xb_barTintColorAction = ^UIColor *(XBTheme *theme) {
        if ([theme isEqualToString:XBThemeNormal]) {
            return [UIColor whiteColor];
        }else{
            return [UIColor colorFromHex:@"#111111"];
        }
    };
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
