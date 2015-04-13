
//
//  PersonalDataViewController.m
//  UIScroll1
//
//  Created by eddie on 15-4-12.
//  Copyright (c) 2015年 Test. All rights reserved.
//

#import "PersonalDataViewController.h"

@interface PersonalDataViewController ()

@end

@implementation PersonalDataViewController
float DEVICE_WIDTH,DEVICE_HEIGHT;
- (void)viewDidLoad {
    [super viewDidLoad];
    DEVICE_WIDTH=[UIScreen mainScreen].bounds.size.width;
    DEVICE_HEIGHT=[UIScreen mainScreen].bounds.size.height;
    
    
    
    
    UITableView *personDataTableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    personDataTableView.dataSource=self;
    personDataTableView.delegate=self;
    [self.view addSubview:personDataTableView];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==0&&indexPath.row==0)
    {
        UITableViewCell *cell=[[UITableViewCell alloc]init];
        cell.textLabel.text=@"头像";
        [cell.textLabel setTextColor:[UIColor blackColor]];
        return  cell;
    }
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];

    if(indexPath.section==0)
    {
        switch (indexPath.row)
        {
            case 1:
                [cell.textLabel setText:@"昵称"];
                break;
            case 2:
                [cell.textLabel setText:@"个人等级"];
                break;
            default:
                
                break;
        }
        
        
        
    
    }
    else if (indexPath.section==1)
    {
        
        switch (indexPath.row)
        {
            case 0:
                [cell.textLabel setText:@"性别"];
                break;
            case 1:
                [cell.textLabel setText:@"地区"];
                break;
              
            default:
                
                break;
        }
    
   
    
    }
    else
    {
        switch (indexPath.row)
        {
            case 0:
                [cell.textLabel setText:@"账号安全"];
                break;
            case 1:
                [cell.textLabel setText:@"注销登录"];
                break;
                
            default:
                
                break;
        }
    }
    [cell.textLabel setTextColor:[UIColor blackColor]];
    return cell;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section==0)return 3;
    else return 2;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==0)
    {
        switch (indexPath.row)
        {
            case 0:
                return 120;
                break;
         
                
            default:
                return 80;
                break;
        }
    }
     else
    {
        return 80;
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
    
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
