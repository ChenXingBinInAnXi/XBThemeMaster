//
//  ViewController.m
//  XBThemeMaster
//
//  Created by chenxingbin on 2018/5/9.
//  Copyright © 2018年 chenxingbin. All rights reserved.
//

#import "ViewController.h"
#import "XBTheme.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    

 
    
    UIButton *btn = [UIButton new];
    btn.frame = CGRectMake(100, 200, 100, 100);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"更改主题" forState:UIControlStateNormal];
    [btn xb_setTitleColorAction:^UIColor *(XBTheme *theme) {
        if ([theme isEqualToString:XBThemeNormal]) {
            return [UIColor blackColor];
        }else{
            return [UIColor whiteColor];
        }
    } forState:UIControlStateNormal];
    
    
    btn.xb_backgroundColorAction = ^UIColor *(XBTheme *theme) {
        if ([theme isEqualToString:XBThemeNormal]) {
            return [UIColor redColor];
        }else{
            return [UIColor grayColor];
        }
    };
    
    
    self.view.xb_backgroundColorAction = [XBCustomerManager xb_bgColorAction];
    
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //NSLog(@"nav back==%@",self.navigationController.navigationBar.backItem);
}


-(void)btnClick{
    XBTheme *theme = [[XBThemeManager sharedManager].currentTheme isEqualToString:XBThemeNormal] ? XBThemeNight : XBThemeNormal;
    [XBThemeManager sharedManager].currentTheme = theme;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)dealloc{
}


@end
