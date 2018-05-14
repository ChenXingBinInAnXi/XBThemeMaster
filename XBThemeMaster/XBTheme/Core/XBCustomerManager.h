//
//  XBCustomerManager.h
//  XBThemeMaster
//
//  Created by chenxingbin on 2018/5/11.
//  Copyright © 2018年 chenxingbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XBThemeManager.h"

//
////自定义类型 如下
static  XBTheme *const XBThemeOther= @"OTHER";



@interface XBCustomerManager : NSObject

+(XBColorAction)xb_nomalTextAction;

+(XBColorAction)xb_bgColorAction;

@end
