
//
//  XBTabBarController.m
//  XBThemeMaster
//
//  Created by chenxingbin on 2018/5/10.
//  Copyright © 2018年 chenxingbin. All rights reserved.
//

#import "XBTabBarController.h"
#import "XBNavigationController.h"
#import "UIColor+Hex.h"
#import "XBTestController.h"
#import "XBTheme.h"

@implementation UIImage (Extensions)
/**iOS7以上  保持图片不被渲染变色*/
+(UIImage *)imageWithName:(NSString *)imageName{
    UIImage *image = [UIImage imageNamed:imageName];
    double version = [[UIDevice currentDevice].systemVersion doubleValue];
    if (version >= 7.0) {
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return image;
}
@end






@interface XBTabBarController()
@end

@implementation XBTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    XBTestController *tabC = [XBTestController new];
    [self addOneChild:tabC title:@"测试" ImageName:@"tabbar-keys-0-icon" SelectImageName:@"tabbar-keys-1-icon"];
    
    UIViewController *vc = [UIViewController new];
    vc.view.backgroundColor = [UIColor whiteColor];
    [self addOneChild:vc title:@"其他" ImageName:@"tabbar-keys-0-icon" SelectImageName:@"tabbar-keys-1-icon"];
}

-(void)addOneChild:(UIViewController *)vc title:(NSString *)title ImageName:(NSString *)imageName SelectImageName:(NSString *)selectImageName{
    vc.title = title;
    
    
    vc.tabBarItem.image = [UIImage imageWithName:imageName];
    vc.tabBarItem.selectedImage = [UIImage imageWithName:selectImageName];
    
    
    XBNavigationController *nav = [[XBNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
    
    
    //tabbar 背景
    self.tabBar.xb_barTintColorAction = ^UIColor *(XBTheme *theme) {
        if ([theme isEqualToString:XBThemeNormal]) {
            return [UIColor whiteColor];
        }else{
            return [UIColor colorFromHex:@"#111111"];
        }
    };
    
    
    vc.tabBarItem.xb_imageAction = ^UIImage *(XBTheme *theme) {
         if ([theme isEqualToString:XBThemeNormal]) {
             return [UIImage imageNamed:@"tabbar-keys-0-icon"];
         }else{
           return [UIImage imageNamed:@"tabbar-service-0-icon"];
          }
    };
    
    vc.tabBarItem.xb_selectedImageAction = ^UIImage *(XBTheme *theme) {
        if ([theme isEqualToString:XBThemeNormal]) {
            return [UIImage imageNamed:@"tabbar-keys-1-icon"];
        }else{
            return [UIImage imageNamed:@"tabbar-service-1-icon"];
        }
    };
    

    
    [vc.tabBarItem xb_setTitleTextAttributes:^NSDictionary *(XBTheme *theme) {

        if ([theme isEqualToString:XBThemeNormal]) {
            //设置tabBarItem的普通文字颜色
            NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
            textAttrs[NSForegroundColorAttributeName] = [UIColor blueColor];
            textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
            [vc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];

            return textAttrs;
        }else{
            //设置tabBarItem的普通文字颜色
            NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
            textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
            textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
            [vc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
            return textAttrs;
        }

    } forState:UIControlStateNormal];


    [vc.tabBarItem xb_setTitleTextAttributes:^NSDictionary *(XBTheme *theme) {

        if ([theme isEqualToString:XBThemeNormal]) {
            NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
            selectTextAttrs[NSForegroundColorAttributeName] = [UIColor colorFromHex:@"#333333"];
            return selectTextAttrs;
        }else{
            NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
            selectTextAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
            return selectTextAttrs;
        }
    } forState:UIControlStateSelected];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
