//
//  UILabel+theme.h
//  XBThemeMaster
//
//  Created by chenxingbin on 2018/5/10.
//  Copyright © 2018年 chenxingbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+theme.h"

@interface UILabel (theme)


@property (nonatomic,copy,setter=xb_setTextColorAction:) XBColorAction xb_textColorAction;
@property (nonatomic,copy,setter=xb_setShadowColorAction:) XBColorAction xb_shadowColorAction;
@property (nonatomic,copy,setter=xb_setHighlightedTextColorAction:) XBColorAction xb_highlightedTextColorAction;



@end
