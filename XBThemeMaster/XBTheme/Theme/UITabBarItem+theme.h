//
//  UITabBarItem+theme.h
//  XBThemeMaster
//
//  Created by chenxingbin on 2018/5/11.
//  Copyright © 2018年 chenxingbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+theme.h"

@interface UITabBarItem (theme)

@property (nonatomic,copy,setter=xb_setImageAction:) XBImageAction xb_imageAction;
@property (nonatomic,copy,setter=xb_setSelectedImageAction:) XBImageAction xb_selectedImageAction;



///可选。 且必须设置imgage. selectedImage属性方能生效 也可设置上面两个属性
-(void)xb_setTitleTextAttributes:(XBAttributesAction)action forState:(UIControlState)state;

@end
