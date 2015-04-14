//
//  TypeTwoViewController.m
//  UIScroll1
//
//  Created by eddie on 15-4-13.
//  Copyright (c) 2015年 Test. All rights reserved.
//

#import "TypeTwoViewController.h"

@interface TypeTwoViewController ()
{
    Btn_TableView *titleBtn;
    UITableView  *listTableView;
}
@end

@implementation TypeTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    titleBtn=[[Btn_TableView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-100)/2, (self.navigationController.navigationBar.frame.size.height-20)/2, 100, 40)];
    
    
    //titleBtn.delegate_Btn_TableView=self;
    titleBtn.m_Btn_Name=@"软实力";
    titleBtn.m_TableViewData=@[@"能力1",@"能力2",@"能力3",@"能力4",@"能力3",@"能力4"];
    [titleBtn addViewData];
    titleBtn.m_ExpandTableVC.tableView.delegate=self;
    titleBtn.m_ExpandTableVC.tableView.dataSource=self;
    [titleBtn.m_ExpandTableVC.tableView setTag: 1];
    [self.navigationController.view addSubview:titleBtn];
    
    
    
    //self.navigationController.navigationBar.frame.size.height
    listTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    listTableView.delegate=self;
    listTableView.dataSource=self;
    [self.view addSubview:listTableView];
    listTableView.rowHeight=200;
    
   // UIEdgeInsetsMake
    [listTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    [listTableView setSeparatorInset:UIEdgeInsetsMake(0, 20, 0, 20)];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(tableView.tag==1){
        [titleBtn expandableButton:titleBtn.m_btn];
    }
    else
    {
        
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if(tableView.tag==1){
        return 1;
    }
    else
    {
        return 1;
    }

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    if(tableView.tag==1)
    {
        static NSString *barCellIdentifier = @"barViewCell";
        cell = [tableView dequeueReusableCellWithIdentifier:barCellIdentifier];
            if (nil == cell) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:barCellIdentifier];
            }
        
        
        	cell.textLabel.text = [titleBtn.m_TableViewData objectAtIndex:indexPath.row];
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            cell.textLabel.backgroundColor = [UIColor clearColor];
        

    }
    else{
        if(indexPath.row==0)
        {
            cell = [[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, tableView.rowHeight)];
            [cell.contentView setFrame:CGRectMake(0, 0, tableView.frame.size.width, tableView.rowHeight)];
         
            UIImageView *imageV=[[UIImageView alloc]initWithFrame:cell.contentView.frame];
            imageV.image=[UIImage imageNamed:@"3"];
            
            [cell.contentView addSubview:imageV];
        
            
        }

        else
        {
           
        static NSString *listCellIdentifier = @"listViewCell";
        cell = [tableView dequeueReusableCellWithIdentifier:listCellIdentifier];
        if (nil == cell)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:listCellIdentifier];
        
        
        }
            [cell.contentView setFrame:CGRectMake(0, 0, tableView.frame.size.width, tableView.rowHeight)];
           
                      UIImageView *imageV=[[UIImageView alloc]initWithFrame:CGRectMake(0, 30, 140, 140)    ];
            imageV.image=[UIImage imageNamed:@"2.JPG"];
  [cell.contentView addSubview:imageV];
            

            [cell.imageView setFrame:CGRectMake(0, 30, 140, 140)];
        cell.textLabel.text = [titleBtn.m_TableViewData objectAtIndex:indexPath.row];
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.backgroundColor = [UIColor clearColor];
        
        }
    }
    cell.selectionStyle=UITableViewCellEditingStyleNone;
    return cell;
    
}




-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView.tag==1) {
        return [titleBtn.m_TableViewData count];
    }
    else{
        
    }
    return 10;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)buton{
    NSLog(@"click!");
}
-(void)viewWillDisappear:(BOOL)animated{
    [titleBtn removeFromSuperview];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    
//}

@end
