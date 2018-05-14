//
//  XBCustomerManager.m
//  XBThemeMaster
//
//  Created by chenxingbin on 2018/5/11.
//  Copyright © 2018年 chenxingbin. All rights reserved.
//
//
#import "XBCustomerManager.h"

@implementation XBCustomerManager

+(XBColorAction)xb_nomalTextAction{
    return ^UIColor *(XBTheme *theme) {
        if ([theme isEqualToString:XBThemeNormal]) {
            return [UIColor grayColor];
        }else{
            return [UIColor whiteColor];
        }
    };
}

+(XBColorAction)xb_bgColorAction{
    return ^UIColor *(XBTheme *theme) {
        if ([theme isEqualToString:XBThemeNormal]) {
            return [UIColor whiteColor];
        }else{
            return [UIColor blackColor];
        }
    };
}





@end
