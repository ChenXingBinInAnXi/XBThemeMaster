
//
//  XBTestController.m
//  XBThemeMaster
//
//  Created by chenxingbin on 2018/5/10.
//  Copyright © 2018年 chenxingbin. All rights reserved.
//

#import "XBTestController.h"
#import "ViewController.h"
#import "XBTestCell.h"
#import "XBTheme.h"

@interface XBTestController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation XBTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    self.tableView.rowHeight = 50;
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(rightItemClick)];
    self.navigationItem.rightBarButtonItem.xb_tintColorAction = ^UIColor *(XBTheme *theme) {
        if ([theme isEqualToString:XBThemeNormal]) {
            return [UIColor blackColor];
        }else{
            return [UIColor whiteColor];
        }
    };
    
    //导航条的主色调颜色(返回按钮颜色)
    self.navigationController.navigationBar.xb_tintColorAction = ^UIColor *(XBTheme *theme) {
        if ([theme isEqualToString:XBThemeNormal]) {
            return [UIColor blackColor];
        }else{
            return [UIColor redColor];
        }
    };
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
   // NSLog(@"==nav=title====%@",self.navigationController.navigationBar.topItem);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}




#pragma mark delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XBTestCell *cell = [XBTestCell cellWithTableView:tableView];
    return cell;
}





#pragma mark event
-(void)rightItemClick{
    ViewController *vc = ViewController.new;
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark getter&&setter
-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [UITableView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.frame = self.view.bounds;
        _tableView.tableFooterView = [UIView new];
        _tableView.xb_backgroundColorAction = [XBCustomerManager xb_bgColorAction];
    }
    return _tableView;
}


@end
