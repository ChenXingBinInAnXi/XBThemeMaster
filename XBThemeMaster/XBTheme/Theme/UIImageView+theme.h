//
//  UIImageView+theme.h
//  XBThemeMaster
//
//  Created by chenxingbin on 2018/5/10.
//  Copyright © 2018年 chenxingbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+theme.h"

@interface UIImageView (theme)

@property (nonatomic,copy,setter=xb_setImageAction:) XBImageAction xb_imageAction;

@property (nonatomic,copy,setter=xb_setAlphaAction:) XBAlphaAction xb_alphaAction;

@end
