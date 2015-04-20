//
//  HotTableVC.m
//  UIScroll1
//
//  Created by eddie on 15-4-19.
//  Copyright (c) 2015年 Test. All rights reserved.
//

#import "HotTableVC.h"
#import "DiscussVC.h"
#define HEIGHT_MARGIN 20
#define WIDTH_MARGIN 20
#define HEAD_WIDTH 50
#define HOTCOUNT  3
#define BTN_HEIGHT_INCELL 30
@interface HotTableVC ()
{
    NSMutableArray *dataArray;
    NSMutableArray *rowHeights;
    DiscussVC *parent;
    UIView *toolBar;
    NSString* date;
}
@end
@implementation HotTableVC
@synthesize parentDelegate;
@synthesize textView;








-(void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"hh:mm  MM-dd"];
    date = [formatter stringFromDate:[NSDate date]];
    
    
    
    
    
    
    
    dataArray=[NSMutableArray arrayWithObjects:@"哈哈啊大但是的阿的啊", @"会哭会发卡手",@"nkadsk的空间阿森纳被打击恐怖jabs第八就是代表就阿克顿本就卡不是第九十八加撒不到家阿三 大步nkadsk的空间阿森纳被打击恐怖jabs第八就是代表就阿克顿本就卡不是第九十八加撒不到家阿三 大步",@"第四个啊啊啊啊",@"第五个个阿凡达 sad 的撒旦四大师噶的大阿的四", @"哈大但是的阿的啊大但是的阿的啊大但是的阿的啊大但是的阿的啊大但是的阿的啊大但是的阿的啊哈啊大但是的阿的但是的阿的啊但是的阿的啊但是的阿的啊但是的阿的啊但是的阿的啊但是的阿的啊啊",nil];
   parent=self.parentDelegate;
    rowHeights=[[NSMutableArray alloc]init];
     self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.tableView setFrame:CGRectMake(0, parent.navigationController.navigationBar.frame.size.height+[UIApplication sharedApplication].statusBarFrame.size.height, self.view.frame.size.width,parent.view.frame.size.height-50-parent.navigationController.navigationBar.frame.size.height-[UIApplication sharedApplication].statusBarFrame.size.height)];
    
    NSLog(@"%@",self.view);
    NSLog(@"%@",self.tableView);
    toolBar=[[UIView alloc]initWithFrame:CGRectMake(0,parent.view.frame.size.height-50,parent.view.frame.size.width,50) ];
    
    toolBar.layer.masksToBounds=YES;
    //  toolBar.layer.cornerRadius=6;
    
    
    
    textView=[[UITextView alloc]initWithFrame:CGRectMake(10, 10, self.view.frame.size.width*0.7-10, 30)];
    textView.bounces=NO;
    textView.layoutManager.allowsNonContiguousLayout = NO;
    textView.layer.borderWidth=2;
    
    textView.layer.borderColor=[UIColor blueColor].CGColor;
    textView.font=[UIFont systemFontOfSize:15];
    textView.layer.cornerRadius=8;
    textView.delegate=self;
    
    
    
    
    UIButton *publishBtn=[[UIButton alloc] initWithFrame:CGRectMake(0.7*self.view.frame.size.width+10, 10, 0.3*self.view.frame.size.width-20, 30)];
    
    
    [publishBtn setBackgroundColor:[UIColor blueColor]];
    publishBtn.layer.cornerRadius=6;
    [publishBtn setTitle:@"发布" forState:UIControlStateNormal];
    [toolBar addSubview:publishBtn];
    [toolBar addSubview:textView];
    [parent.view addSubview: toolBar];
    
    
}
-(void)textViewDidChange:(UITextView *)textView1{
    NSLog(@"didchange!");
    
    
    
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyUp:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyDown:) name:UIKeyboardWillHideNotification object:nil];
}
-(void)keyUp:(NSNotification *)notification{
    NSValue *keyboardObject = [[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey];
    
    CGRect keyboardRect;
    [keyboardObject getValue:&keyboardRect];
    
    NSNumber *duration = [notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [notification.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    
    
    [parent.view bringSubviewToFront:toolBar];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:[duration doubleValue]];
    [UIView setAnimationCurve:[curve intValue]];
    [UIView setAnimationDelegate:self];
    [toolBar setFrame:CGRectMake(0, parent.view.frame.size.height -keyboardRect.size.height-50, parent.view.frame.size.width , 50)];
    
    
    [UIView commitAnimations];
    
    
}
-(void)keyDown:(NSNotification *)notification{
    
    NSNumber *duration = [notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [notification.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    
    [parent.view bringSubviewToFront:toolBar];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:[duration doubleValue]];
    [UIView setAnimationCurve:[curve intValue]];
    [UIView setAnimationDelegate:self];
    [toolBar setFrame:CGRectMake(0, parent.view.frame.size.height -50, parent.view.frame.size.width , 50)];
    
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [textView resignFirstResponder];
    
}
-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"shangji!!!!!!!!");
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    if([scrollView isKindOfClass:[UITableView class]])
    {
        [textView resignFirstResponder];
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
 
    
        NSString *str=[dataArray objectAtIndex:(indexPath.row)];
        UILabel *discussTextL=[[UILabel alloc]init];
        discussTextL.text=str;
        discussTextL.numberOfLines=0;
        CGSize cellSize=[discussTextL sizeThatFits:CGSizeMake(self.view.frame.size.width-2*WIDTH_MARGIN-HEAD_WIDTH-10, 500)];
        
        if(cellSize.height>(HEAD_WIDTH+2*HEIGHT_MARGIN))
        {
            
            return cellSize.height+2*HEIGHT_MARGIN+BTN_HEIGHT_INCELL;
        }
        else{
            return HEAD_WIDTH+2*HEIGHT_MARGIN+BTN_HEIGHT_INCELL;
        }
    
  
  
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return dataArray.count;
    
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
        NSLog(@"chuangjian");
        
    }
    else{
        // 删除cell中的子对象,刷新覆盖问题。
        while ([cell.contentView.subviews lastObject] != nil) {
            [(UIView*)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    
    {
        
        
        
        
        
        NSString *str=[dataArray objectAtIndex:(indexPath.row)];
        UICopyLable *discussTextL=[[UICopyLable alloc]init];
        discussTextL.text=str;
        discussTextL.numberOfLines=0;
        discussTextL.tableDelegate=self;
        discussTextL.cellDelegate=cell;
        [discussTextL setHighlightedTextColor:[UIColor blueColor]];
        discussTextL.userInteractionEnabled=YES;
        CGSize cellSize=[discussTextL sizeThatFits:CGSizeMake(self.view.frame.size.width-2*WIDTH_MARGIN-HEAD_WIDTH-10, 500)];
        [discussTextL setFrame:CGRectMake(WIDTH_MARGIN+HEAD_WIDTH+20,HEIGHT_MARGIN,cellSize.width, cellSize.height)];
        
        
        UIImageView *imageV=[[UIImageView alloc]initWithFrame:CGRectMake(WIDTH_MARGIN, HEIGHT_MARGIN, HEAD_WIDTH , HEAD_WIDTH)];
        imageV.image=[UIImage imageNamed:@"2.JPG"];
        
        
        //用户名标签
        UILabel *userNameLable=[[UILabel alloc]init];
        userNameLable.numberOfLines=1;
        userNameLable.text=@"用户名字哈哈哈啊哈";
        userNameLable.font=[UIFont systemFontOfSize:8];
        userNameLable.textColor=[UIColor blueColor];
        userNameLable.textAlignment=NSTextAlignmentCenter;
        CGSize  nameSize= [userNameLable sizeThatFits:CGSizeMake(HEAD_WIDTH+15, 11)];
        [userNameLable setFrame:CGRectMake(WIDTH_MARGIN+HEIGHT_MARGIN/2-nameSize.width/2, HEAD_WIDTH+HEIGHT_MARGIN+10, nameSize.width, 10)];
        [userNameLable setCenter:CGPointMake(imageV.center.x, userNameLable.center.y)];
        
        
        
        if(discussTextL.frame.size.height>HEAD_WIDTH )
        {
            [cell setFrame:CGRectMake(0, 0, tableView.frame.size.width, discussTextL.frame.size.height+2*HEIGHT_MARGIN+BTN_HEIGHT_INCELL)];
            
        }
        else{
            [cell setFrame:CGRectMake(0, 0, tableView.frame.size.width, HEAD_WIDTH+2*HEIGHT_MARGIN+BTN_HEIGHT_INCELL)];
            
        }
        
        [cell.contentView setFrame:cell.frame];
        
        [cell.contentView addSubview:imageV];
        [cell.contentView addSubview:discussTextL];
        [cell.contentView addSubview:userNameLable];
        
        //自定义华丽分割线
        UIView *separatorView=[[UIView alloc]initWithFrame:CGRectMake(WIDTH_MARGIN,cell.frame.size.height-1 , self.view.frame.size.width-2*WIDTH_MARGIN, 1)];
        [separatorView setBackgroundColor:[UIColor blackColor]];
        separatorView.alpha=0.1;
        [cell.contentView addSubview:separatorView];
        
        
        //时间标签
        UILabel *timeLable=[[UILabel alloc]init];
        timeLable.textColor=[UIColor grayColor];
        timeLable.text=date;
        timeLable.numberOfLines=1;
        timeLable.textAlignment=NSTextAlignmentLeft;
        CGSize dateSize=[timeLable sizeThatFits:CGSizeMake(100, 15)];
        [timeLable setFrame:CGRectMake(0.6*cell.frame.size.width,cell.frame.size.height-21 , dateSize.width, 15)];
        
        [cell.contentView addSubview:timeLable];
        timeLable.font=[UIFont systemFontOfSize:10];
        
        
        UIButton *thumbUp=[[UIButton alloc]init];
        [thumbUp setTitle:@"赞" forState:UIControlStateNormal];
        [thumbUp setTitleColor: [UIColor grayColor]forState:UIControlStateNormal];
        thumbUp.titleLabel.font=timeLable.font;
        [cell.contentView addSubview:thumbUp];
        [thumbUp setTranslatesAutoresizingMaskIntoConstraints:NO];
        thumbUp.layer.masksToBounds=YES;
        
        
        
        NSLayoutConstraint *constraint=[NSLayoutConstraint constraintWithItem:timeLable attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:thumbUp attribute:NSLayoutAttributeTop multiplier:1 constant:0];
        [cell.contentView addConstraint:constraint];
        constraint=[NSLayoutConstraint constraintWithItem:timeLable attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:thumbUp attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
        [cell.contentView addConstraint:constraint];
        constraint=[NSLayoutConstraint constraintWithItem:timeLable attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:thumbUp attribute:NSLayoutAttributeRight multiplier:1 constant:-10];
        [cell.contentView addConstraint:constraint];
        constraint=[NSLayoutConstraint constraintWithItem:cell.contentView                                                attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationLessThanOrEqual toItem:thumbUp attribute:NSLayoutAttributeRight multiplier:1 constant:WIDTH_MARGIN+20];
        [cell.contentView addConstraint:constraint];
        
    
       }
  
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.backgroundColor=[UIColor clearColor];
    return cell;
}


@end
