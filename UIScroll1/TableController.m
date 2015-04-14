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
{
    NSMutableArray *tableDataArray;
}
@end

@implementation TableController
@synthesize mainDelegate;
@synthesize isLoading;
float DEVICE_WIDTH,DEVICE_HEIGHT;
- (void)viewDidLoad {
    [super viewDidLoad];
    DEVICE_WIDTH=[UIScreen mainScreen].bounds.size.width;
    DEVICE_HEIGHT=[UIScreen mainScreen].bounds.size.height;
    
    self.tableView=[[UITableView alloc]initWithFrame:
                    CGRectMake(0, 160, DEVICE_WIDTH, DEVICE_HEIGHT-35)];
    self.tableView.bounces=YES;
 self.tableView.rowHeight=200;
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    self.tableView.showsVerticalScrollIndicator=NO;
    
   
    tableDataArray=[NSMutableArray arrayWithObjects:@"标题1",@"标题2",@"标题3", nil];
    isLoading=NO;
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
    return ([tableDataArray count]);
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
   
   
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
 [self.navigationController pushViewController:tc animated:NO];
    tc.navigationController.navigationBarHidden=YES;
    
}

 // In a storyboard-based application, you will often want to do a little preparation before navigation


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if(indexPath.row!=[self.tableView numberOfRowsInSection:indexPath.section]-1)
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
//    else
//    { UITableViewCell *footerCell=[[UITableViewCell alloc]initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 100)];
//           NSLog(@"foot!");
//        return footerCell;
//    }
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
//    if(!isLoading && scrollView.contentOffset.y > ((scrollView.contentSize.height - scrollView.frame.size.height)))
    
    {
        isLoading=YES;
                // [self loadData];
    }
    

}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//    if(indexPath.row==[tableView numberOfRowsInSection:indexPath.section]-1)
//    {
//       
//        UIActivityIndicatorView *tableFooterActivityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(self.tableView.frame.size.width/2-50, 0.0f, 100.0f, 100.0f)];
//        [tableFooterActivityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
//        [tableFooterActivityIndicator startAnimating];
//        [cell addSubview:tableFooterActivityIndicator];
//
//    }
}

-(void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section{
   
//    [self.tableView setTableFooterView:[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 100)]];
//    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 100)];
//    [lable setText:@"上拉加载更多"];
//    [lable setTextColor:[UIColor blackColor]];
//    [self.tableView.tableFooterView setBackgroundColor:[UIColor blackColor]];
//    [self.tableView.tableFooterView addSubview:lable];
//}
}
-(void)loadData{
    [tableDataArray addObject:@"hello!"];
    self.tableView.tableFooterView=nil;
    [self.tableView reloadData];
}
@end
