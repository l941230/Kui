//
//  TableViewController.m
//  UIScroll1
//
//  Created by eddie on 15-3-29.
//  Copyright (c) 2015年 Test. All rights reserved.
//

#import "TableController.h"
#import "imageViewCell.h"
#import "usualViewCell.h"
#import "mainViewController.h"
#import "TitleViewController.h"
@interface TableController ()

@end

@implementation TableController
@synthesize mainDelegate;
float DEVICE_WIDTH,DEVICE_HEIGHT;
- (void)viewDidLoad {
    [super viewDidLoad];
    DEVICE_WIDTH=[UIScreen mainScreen].bounds.size.width;
    DEVICE_HEIGHT=[UIScreen mainScreen].bounds.size.height;
    
    self.tableView=[[UITableView alloc]initWithFrame:
                    CGRectMake(0, 160, DEVICE_WIDTH, DEVICE_HEIGHT-35)];
    self.tableView.rowHeight=200;
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 3;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TitleViewController *tc=[[TitleViewController alloc]init];
    tc.navdelegate=self.mainDelegate;
    CATransition *transition = [CATransition animation];
    transition.duration = 0.5;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromRight;
    transition.delegate = self;
    //[self.navigationController.view.layer addAnimation:transition forKey:nil];
    [tc.view.layer addAnimation:transition forKey:nil];
    [self.navigationController pushViewController:tc animated:NO];
    
    
}

 // In a storyboard-based application, you will often want to do a little preparation before navigation


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    if(indexPath.row%3==0)
    {
        static NSString *ImageIdentifier=@"ImageIdentifier";
        cell=[tableView dequeueReusableCellWithIdentifier:ImageIdentifier];
        if(cell==nil)
        {
            cell=[[imageViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ImageIdentifier];
            
        }
    }
    else
    {
        
        static NSString *UsualIdentifier=@"UsualIdentifier";
        cell=[tableView dequeueReusableCellWithIdentifier:UsualIdentifier];
        if(cell==nil)
        {
            cell=[[usualViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:UsualIdentifier];
        }
        
    }
    return cell;
}

@end
