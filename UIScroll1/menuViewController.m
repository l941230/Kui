//
//  menuViewController.m
//  UIScroll1
//
//  Created by eddie on 15-3-21.
//  Copyright (c) 2015年 Test. All rights reserved.
//

#import "menuViewController.h"
#import "LoginSingle.h"

@interface menuViewController ()
{
    rootViewController *root;
}

@end

@implementation menuViewController
@synthesize menuTableView;
@synthesize rootDelegate;
float DEVICE_WIDTH,DEVICE_HEIGHT;
float VIEW_WIDTH;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    DEVICE_WIDTH=[UIScreen mainScreen].bounds.size.width;
    DEVICE_HEIGHT=[UIScreen mainScreen].bounds.size.height;
    VIEW_WIDTH=0.75*DEVICE_WIDTH;
    
    UIButton *backBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, self.navigationController.navigationBar.frame.size.height)];
    
    UIBarButtonItem *back=[[UIBarButtonItem alloc]initWithCustomView:backBtn];
    [backBtn setBackgroundColor:[UIColor blackColor]];
     root=self.rootDelegate;
    //root.nav.navigationItem.backBarButtonItem=back;
   NSLog(@"%@-------%@",back,root.nav);
    //判断是否登录了
    LoginSingle *login=[LoginSingle newinstance];
    if(login.isLogined)
    {
    UIView *headView=[[UIView alloc]initWithFrame:CGRectMake(VIEW_WIDTH/3, DEVICE_HEIGHT/11,VIEW_WIDTH/3, VIEW_WIDTH/3)];
    [self.view addSubview:headView];
    UIButton *headViewBtn=[[UIButton alloc]initWithFrame:CGRectMake(0 , 0, VIEW_WIDTH/3, VIEW_WIDTH/3)];
    headViewBtn.layer.cornerRadius=headViewBtn.layer.frame.size.width/2;
    [headViewBtn setBackgroundColor:[UIColor redColor]];
    [headView addSubview:headViewBtn];
    
    UIButton *lableBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, DEVICE_HEIGHT/11+VIEW_WIDTH/3+DEVICE_HEIGHT*0.02, VIEW_WIDTH, DEVICE_HEIGHT*0.05)];
//    lableBtn.center=CGPointMake(VIEW_WIDTH/2, DEVICE_HEIGHT/11+VIEW_WIDTH/3+30);
    [lableBtn setTitle:@"用户名" forState:UIControlStateNormal];
    [lableBtn setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:lableBtn];
    
    
    UIButton *discussBtn=[[UIButton alloc]initWithFrame:CGRectMake(VIEW_WIDTH/5, DEVICE_HEIGHT/11+VIEW_WIDTH/3+DEVICE_HEIGHT*0.09, VIEW_WIDTH/4, 3*VIEW_WIDTH/25)];
    [discussBtn setTitle: @"我的足迹" forState:UIControlStateNormal];
    [discussBtn setBackgroundColor:[UIColor greenColor]];
    
    UIButton *likeBtn=[[UIButton alloc]initWithFrame:CGRectMake(         3*VIEW_WIDTH/5, DEVICE_HEIGHT/11+VIEW_WIDTH/3+DEVICE_HEIGHT*0.09, VIEW_WIDTH/4, 3*VIEW_WIDTH/25)];
    [likeBtn setTitle: @"我的喜欢" forState:UIControlStateNormal];
    [likeBtn setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:discussBtn];
    [self.view addSubview:likeBtn];
  
    }
    else
    {
        UIView *headView=[[UIView alloc]initWithFrame:CGRectMake(VIEW_WIDTH/3, DEVICE_HEIGHT/11,VIEW_WIDTH/3, VIEW_WIDTH/3)];
        [self.view addSubview:headView];
        UIButton *headViewBtn=[[UIButton alloc]initWithFrame:CGRectMake(0 , 0, VIEW_WIDTH/3, VIEW_WIDTH/3)];
        headViewBtn.layer.cornerRadius=headViewBtn.layer.frame.size.width/2;
        [headViewBtn setBackgroundColor:[UIColor redColor]];
        [headView addSubview:headViewBtn];
        
        
        
        UIButton *loginBtn=[[UIButton alloc]initWithFrame:CGRectMake(VIEW_WIDTH/5, DEVICE_HEIGHT/11+VIEW_WIDTH/3+DEVICE_HEIGHT*0.09, VIEW_WIDTH/4, 3*VIEW_WIDTH/25)];
        [loginBtn setTitle: @"登录" forState:UIControlStateNormal];
        [loginBtn setBackgroundColor:[UIColor greenColor]];
        [loginBtn addTarget:self action:@selector(pushLogin) forControlEvents:UIControlEventTouchDown];
        
        
        
        UIButton *registerBtn=[[UIButton alloc]initWithFrame:CGRectMake(         3*VIEW_WIDTH/5, DEVICE_HEIGHT/11+VIEW_WIDTH/3+DEVICE_HEIGHT*0.09, VIEW_WIDTH/4, 3*VIEW_WIDTH/25)];
        [registerBtn setTitle: @"注册" forState:UIControlStateNormal];
        [registerBtn setBackgroundColor:[UIColor greenColor]];
        [self.view addSubview:loginBtn];
        [self.view addSubview:registerBtn];
        
    }
    
    
    
    
    
    
    menuTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0.45*DEVICE_HEIGHT, 0.75*DEVICE_WIDTH, 0.4*DEVICE_HEIGHT)];
    menuTableView.delegate=self;
    menuTableView.dataSource=self;
   menuTableView.rowHeight=70;
    [self.view addSubview:menuTableView];
    
    
    
    UIButton *offlineDownloadBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0.95*DEVICE_HEIGHT, VIEW_WIDTH/3, 0.05*DEVICE_HEIGHT)];
    [offlineDownloadBtn setTitle:@"下载" forState:UIControlStateNormal];
    [offlineDownloadBtn setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:offlineDownloadBtn];
    
    UIButton *nightModelBtn=[[UIButton alloc]initWithFrame:CGRectMake(VIEW_WIDTH/3+8, 0.95*DEVICE_HEIGHT, VIEW_WIDTH/3, 0.05*DEVICE_HEIGHT)];
    [nightModelBtn setTitle:@"夜间模式" forState:UIControlStateNormal];
    [nightModelBtn setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:nightModelBtn];

    
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
   
        

        {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:nil
                  ];
        }
    switch (indexPath.row) {
        case 0:
        
            cell.textLabel.text=@"消息";
            
            break;
        case 1:
            cell.textLabel.text=@"反馈";
            
            break;

        case 2:
            cell.textLabel.text=@"设置";
            
            break;
        case 3:
            cell.textLabel.text=@"关于";
            
            break;

        default:
            break;
    }
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    if(indexPath.row==2)
    {
       root=self.rootDelegate;
        [root.scView setContentOffset:CGPointMake(0.75*DEVICE_WIDTH, 0)animated:YES];
        PersonalDataViewController *personDataVC=[[PersonalDataViewController alloc]init];
       
        [root.nav pushViewController:personDataVC animated:YES];
    }

}
-(void)pushLogin{
  root=self.rootDelegate;
    
    [root.scView setContentOffset:CGPointMake(0.75*DEVICE_WIDTH, 0)animated:YES];
   
    LoginViewController *loginVC=[[LoginViewController alloc]init];
    loginVC.view.backgroundColor=[UIColor whiteColor];
    [root.nav pushViewController:loginVC animated:YES];
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
