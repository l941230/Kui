//
//  DiscussVC.m
//  UIScroll1
//
//  Created by eddie on 15-4-15.
//  Copyright (c) 2015年 Test. All rights reserved.
//

#import "DiscussVC.h"

@interface DiscussVC ()

@end

@implementation DiscussVC

- (void)viewDidLoad {
    [super viewDidLoad];
    HaveHotTableVC *VC=[[HaveHotTableVC alloc]init];
    VC.parentDelegate=self;
    [self.view addSubview:VC.tableView];
    [self addChildViewController:VC];
    // Do any additional setup after loading the view.
    
     
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
