//
//  UITableView+theme.h
//  XBThemeMaster
//
//  Created by chenxingbin on 2018/5/10.
//  Copyright © 2018年 chenxingbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+theme.h"

@interface UITableView (theme)

@property (nonatomic,copy,setter=xb_setSeparatorColorAction:) XBColorAction xb_separatorColorAction;
@property (nonatomic,copy,setter=xb_setSectionIndexColorAction:) XBColorAction xb_sectionIndexColorAction;
@property (nonatomic,copy,setter=xb_setSectionIndexBackgroundColorAction:) XBColorAction xb_sectionIndexBackgroundColorAction;
@property (nonatomic,copy,setter=xb_setSectionIndexTrackingBackgroundColorAction:) XBColorAction xb_sectionIndexTrackingBackgroundColorAction;

@end
