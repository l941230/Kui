//
//  TypeTwoViewController.m
//  UIScroll1
//
//  Created by eddie on 15-4-13.
//  Copyright (c) 2015年 Test. All rights reserved.
//

#import "TypeTwoViewController.h"
#define LIST_MARGIN_WIDTH  20
#define LIST_MARGIN_HEIGHT  30
@interface TypeTwoViewController ()
{
    Btn_TableView *titleBtn;
    UITableView  *listTableView;
    UIButton *TypeBtn;
    UIButton *likeBtn;
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
    
    
    
    listTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    listTableView.delegate=self;
    listTableView.dataSource=self;
    
    listTableView.rowHeight=200;
    
   
    [listTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    [listTableView setSeparatorInset:UIEdgeInsetsMake(0, LIST_MARGIN_WIDTH, 0, LIST_MARGIN_WIDTH)];
    [self.view addSubview:listTableView];
    
    
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
            imageV.image=[UIImage imageNamed:@"zhuozi"];
            
            [cell.contentView addSubview:imageV];
        
            
            
            UILabel *textLBL=[[UILabel alloc]init];
            textLBL.numberOfLines=0;
            textLBL.lineBreakMode = NSLineBreakByWordWrapping;
            textLBL.textAlignment=NSTextAlignmentCenter;
            NSString *titleStr=@"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈";
            //            IOS8.0以下
            //            CGSize size=[titleStr sizeWithFont:textLBL.font constrainedToSize:CGSizeMake( cell.contentView.frame.size.width-cell.contentView.frame.size.height-10, 200) lineBreakMode:NSLineBreakByWordWrapping];
            textLBL.font=[UIFont systemFontOfSize:16];
            textLBL.shadowOffset=CGSizeMake(2, 2);
            textLBL.shadowColor=[UIColor blackColor];
            
            textLBL.text=titleStr;
            CGSize  size=[textLBL sizeThatFits:CGSizeMake(tableView.frame.size.width*0.6, 200)];
      textLBL.frame=CGRectMake(0.2*tableView.frame.size.width,120,tableView.frame.size.width*0.6   ,size.height);
//            textLBL.layer.shadowColor=(__bridge CGColorRef)([UIColor blackColor]);
//            textLBL.layer.shadowOpacity=1;
//            textLBL.layer.shadowOffset=CGSizeMake(4, 4);
           [textLBL setTextColor:[UIColor whiteColor]];
//            [textLBL setTintColor:[UIColor blackColor]];
            [cell.contentView addSubview:textLBL];
        }

        else
        {
           
        static NSString *listCellIdentifier = @"listViewCell";
        cell = [tableView dequeueReusableCellWithIdentifier:listCellIdentifier];
        if (nil == cell)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:listCellIdentifier];
        
        
        }
            [cell.contentView setFrame:CGRectMake(LIST_MARGIN_WIDTH, LIST_MARGIN_HEIGHT, tableView.frame.size.width-LIST_MARGIN_WIDTH*2, tableView.rowHeight-LIST_MARGIN_HEIGHT*2)];
           
                      UIImageView *imageV=[[UIImageView alloc]initWithFrame:CGRectMake(LIST_MARGIN_WIDTH, LIST_MARGIN_HEIGHT, cell.contentView.frame.size.height, cell.contentView.frame.size.height)];
            imageV.image=[UIImage imageNamed:@"2.JPG"];
  [cell.contentView addSubview:imageV];
            
       

    
        
//        cell.textLabel.backgroundColor = [UIColor clearColor];
            
            UILabel *textLBL=[[UILabel alloc]init];
            textLBL.numberOfLines=0;
            textLBL.font=[UIFont systemFontOfSize:16];
           textLBL.lineBreakMode = NSLineBreakByWordWrapping;
            NSString *titleStr=@"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈";
            textLBL.backgroundColor=[UIColor clearColor];
//            IOS8.0以下
//            CGSize size=[titleStr sizeWithFont:textLBL.font constrainedToSize:CGSizeMake( cell.contentView.frame.size.width-cell.contentView.frame.size.height-10, 200) lineBreakMode:NSLineBreakByWordWrapping];
            textLBL.text=titleStr;
           //
            CGSize  size=[textLBL sizeThatFits:CGSizeMake(cell.contentView.frame.size.width-cell.contentView.frame.size.height-10, 200)];
          
            textLBL.frame=CGRectMake(LIST_MARGIN_WIDTH+cell.contentView.frame.size.height+10,LIST_MARGIN_HEIGHT,cell.contentView.frame.size.width-cell.contentView.frame.size.height-10, size.height);
            
            [cell.contentView addSubview:textLBL];
        
            likeBtn=[[UIButton alloc]initWithFrame:CGRectMake(cell.contentView.frame.size.width+LIST_MARGIN_WIDTH-40, cell.contentView.frame.size.height+LIST_MARGIN_HEIGHT-20, 40, 20)];
            [likeBtn setTitle:@"喜欢" forState:UIControlStateNormal];

            [likeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [cell.contentView addSubview:likeBtn];
            
            
            
            TypeBtn=[[UIButton alloc]initWithFrame:CGRectMake(cell.contentView.frame.size.width+LIST_MARGIN_WIDTH-90, cell.contentView.frame.size.height+LIST_MARGIN_HEIGHT-20, 40, 20)];
            [TypeBtn setTitle:@"类别" forState:UIControlStateNormal];
            
            [TypeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [cell.contentView addSubview:TypeBtn];
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
