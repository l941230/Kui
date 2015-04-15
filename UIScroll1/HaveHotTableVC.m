//
//  HaveHotTableVC.m
//  UIScroll1
//
//  Created by eddie on 15-4-15.
//  Copyright (c) 2015年 Test. All rights reserved.
//

#import "HaveHotTableVC.h"
#define HEIGHT_MARGIN 20
#define WIDTH_MARGIN 20
#define HEAD_WIDTH 50

@interface HaveHotTableVC ()
{
    NSMutableArray *dataArray;
}
@end

@implementation HaveHotTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
//    [dataArray initWithArray:@{ @"哈哈啊大但是的阿的啊", @"会哭会发卡手",@"nkadsk的空间阿森纳被打击恐怖jabs第八就是代表就阿克顿本就卡不是第九十八加撒不到家阿三 大步",@"第五个啊啊啊啊"}];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    static NSString *hotDiscussCellIdentifier = @"hotDiscussViewCell";
    cell = [tableView dequeueReusableCellWithIdentifier:hotDiscussCellIdentifier];
    if (nil == cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:hotDiscussCellIdentifier];
        
        
    }

    if(indexPath.row<3){
        
               [cell.contentView setFrame:CGRectMake(WIDTH_MARGIN, HEIGHT_MARGIN, tableView.frame.size.width-WIDTH_MARGIN*2, tableView.rowHeight-HEIGHT_MARGIN*2)];
        
        UIImageView *imageV=[[UIImageView alloc]initWithFrame:CGRectMake(WIDTH_MARGIN, HEIGHT_MARGIN, HEAD_WIDTH , HEAD_WIDTH)];
        imageV.image=[UIImage imageNamed:@"2.JPG"];
        [cell.contentView addSubview:imageV];
        
        
        
        
    }
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
