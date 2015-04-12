//
//  TitleViewController.m
//  UIScroll1
//
//  Created by eddie on 15-3-31.
//  Copyright (c) 2015年 Test. All rights reserved.
//

#import "TitleViewController.h"

@interface TitleViewController ()
{
    UIView *shareView;
    UIView *blackView;
    UIViewController *wbVC;
}
@end

@implementation TitleViewController
@synthesize navdelegate;
@synthesize toolBar;
@synthesize btn;
float DEVICE_WIDTH,DEVICE_HEIGHT;
bool isShow=YES;
struct PPoint{
    float x,y;
};
struct PPoint touch_Begin;
struct PPoint touch_Current;
struct PPoint touch_End;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    TitleWebView *webView=[[TitleWebView alloc]init];
    DEVICE_WIDTH=[UIScreen mainScreen].bounds.size.width;
    DEVICE_HEIGHT=[UIScreen mainScreen].bounds.size.height;
    

    UIButton *discussBtn=[[UIButton alloc]initWithFrame:CGRectMake(10, 0, 80, 60)];
    [discussBtn setTitle:@"评论" forState:UIControlStateNormal];
    [discussBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    UIButton *likeBtn=[[UIButton alloc]initWithFrame:CGRectMake(100 , 0, 80, 60)];
    [likeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [likeBtn setTitle:@"收藏" forState:UIControlStateNormal];
    [likeBtn addTarget:self action:@selector(like) forControlEvents:UIControlEventTouchDown];
    
    
    UIButton *shareBtn=[[UIButton alloc]initWithFrame:CGRectMake(190 , 0, 80, 60)];
    [shareBtn setTitle:@"分享" forState:UIControlStateNormal];
    [shareBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [shareBtn addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchDown];
    btn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn setTintColor:[UIColor blackColor]];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchDown];
   
    toolBar=[[UIToolbar alloc]init];
   
    [toolBar setFrame:CGRectZero];
    [toolBar setTranslatesAutoresizingMaskIntoConstraints:NO];
    toolBar.layer.masksToBounds=YES;
    toolBar.layer.cornerRadius=6;
    toolBar.layer.borderWidth=1;
    [self.view addSubview:webView];
    [self.view addSubview:btn];
    [toolBar addSubview:likeBtn];
    [toolBar addSubview:discussBtn];
    [toolBar addSubview:shareBtn];
    [self.view addSubview:toolBar];
 
    NSLayoutConstraint *constraint=[NSLayoutConstraint constraintWithItem:toolBar attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1   constant:0];
    [self.view addConstraint:constraint];
    
    constraint=[NSLayoutConstraint constraintWithItem:toolBar attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1   constant:0];
    [self.view addConstraint:constraint];
    constraint=[NSLayoutConstraint constraintWithItem:toolBar attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1   constant:0];
    [self.view addConstraint:constraint];
    constraint=[NSLayoutConstraint constraintWithItem:toolBar attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1   constant:-50];
    [self.view addConstraint:constraint];

    //弹出分享界面
    blackView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT)];
    [blackView setBackgroundColor: [UIColor blackColor]];
    [blackView setAlpha:0.5];
   [blackView setHidden:YES];
    [self.view addSubview:blackView];
    blackView.userInteractionEnabled=NO;
    shareView=[[UIView alloc]initWithFrame:CGRectMake(0, 0.5*DEVICE_HEIGHT,DEVICE_WIDTH, 0.5*DEVICE_HEIGHT)];
    [shareView setHidden:YES];
    UIButton *cancelBtn=[[UIButton alloc]initWithFrame:CGRectMake(10, 0.4*DEVICE_HEIGHT, DEVICE_WIDTH-20, 0.07*DEVICE_HEIGHT)];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    cancelBtn.layer.cornerRadius=8;
    [cancelBtn setBackgroundColor:[UIColor whiteColor]];
    [cancelBtn addTarget:self action:@selector(dismissShare) forControlEvents:UIControlEventTouchDown];
    [shareView addSubview:cancelBtn];
    UIView *subshare=[[UIView alloc]initWithFrame: CGRectMake(10, 10, DEVICE_WIDTH-20, 0.4*DEVICE_HEIGHT-20)];
    subshare.layer.cornerRadius=10;
    [subshare setBackgroundColor:[UIColor whiteColor]];
    
    //分享按钮
    
    UIButton *sinaShareBtn=[[UIButton alloc]initWithFrame:CGRectZero];
    [sinaShareBtn setTitle:@"新浪微博" forState:UIControlStateNormal];
    [sinaShareBtn addTarget:self action:@selector(sinaShare) forControlEvents:UIControlEventTouchDown];
    [sinaShareBtn setFrame:CGRectMake(10, 10, subshare.frame.size.width/3-20, subshare.frame.size.height/2-20)];
    UIButton *wechatShareBtn=[[UIButton alloc]initWithFrame:CGRectZero];
    [wechatShareBtn setTitle:@"朋友圈" forState:UIControlStateNormal];
    [wechatShareBtn addTarget:self action:@selector(wechatShare) forControlEvents:UIControlEventTouchDown];
    [wechatShareBtn setFrame:CGRectMake(10+subshare.frame.size.width/3, 10, subshare.frame.size.width/3-20, subshare.frame.size.height/2-20)];
    UIButton *wechatFriendsShareBtn=[[UIButton alloc]initWithFrame:CGRectZero];
    [wechatFriendsShareBtn setTitle:@"微信好友" forState:UIControlStateNormal];
    [wechatFriendsShareBtn addTarget:self action:@selector(wechatFriendsShare) forControlEvents:UIControlEventTouchDown];
    [wechatFriendsShareBtn setFrame:CGRectMake(10+2*subshare.frame.size.width/3, 10, subshare.frame.size.width/3-20, subshare.frame.size.height/2-20)];
    
    
    UIButton *renrenShareBtn=[[UIButton alloc]initWithFrame:CGRectZero];
    [renrenShareBtn setTitle:@"人人" forState:UIControlStateNormal];
    [renrenShareBtn addTarget:self action:@selector(sinaShare) forControlEvents:UIControlEventTouchDown];
     [renrenShareBtn setFrame:CGRectMake(10, 10+subshare.frame.size.height/2, subshare.frame.size.width/3-20, subshare.frame.size.height/2-20)];
    
    UIButton *qqShareBtn=[[UIButton alloc]initWithFrame:CGRectZero];
    [qqShareBtn setTitle:@"QQ好友" forState:UIControlStateNormal];
    [qqShareBtn addTarget:self action:@selector(qqShare) forControlEvents:UIControlEventTouchDown];
    
    [qqShareBtn setFrame:CGRectMake(10+subshare.frame.size.width/3, 10+subshare.frame.size.height/2, subshare.frame.size.width/3-20, subshare.frame.size.height/2-20)];
    UIButton *qqZoneShareBtn=[[UIButton alloc]initWithFrame:CGRectZero];
    [qqZoneShareBtn setTitle:@"QQ空间" forState:UIControlStateNormal];
    [qqZoneShareBtn addTarget:self action:@selector(qqZoneShare )forControlEvents:UIControlEventTouchDown];
    [qqZoneShareBtn setFrame:CGRectMake(10+2*subshare.frame.size.width/3, 10+subshare.frame.size.height/2, subshare.frame.size.width/3-20, subshare.frame.size.height/2-20)];
    
    
    [subshare addSubview:qqShareBtn];
    [subshare addSubview:qqZoneShareBtn];
    [subshare addSubview:renrenShareBtn];
    [subshare addSubview:sinaShareBtn];
    [subshare addSubview:wechatFriendsShareBtn];
    [subshare addSubview:wechatShareBtn];
    for(UIButton *btnn in subshare.subviews)
    {
        [btnn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    [shareView addSubview:subshare];
    
    [self.view addSubview:shareView];
    
//    [self.view layoutSubviews];
  //   NSLog(@"%f,%f,%f,%f",toolBar.frame.origin.x,toolBar.frame.origin.y,toolBar.frame.size.width,toolBar.frame.size.height);
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    
//    [UIView animateWithDuration:0.5 animations:^{
//        if(isShow)
//        [btn setAlpha:0];
//        else
//            [btn setAlpha:1];
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self.view];
    touch_Begin.x=touchPoint.x;
    touch_Begin.y=touchPoint.y;
    
//    }];
    
}
-(void)like
{
    wbVC=[[UIViewController alloc]init];

    UIWebView *wbv=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, 0.5*DEVICE_WIDTH, 0.5*DEVICE_HEIGHT)];
    [wbVC.view addSubview:wbv];
    [wbVC.view setBackgroundColor:[UIColor blackColor]];
    UIButton *btnn=[[UIButton alloc]initWithFrame:CGRectMake(0, DEVICE_HEIGHT*0.5, 80, 50)];
    [btnn setTitle:@"返回" forState:UIControlStateNormal];
    [wbVC.view addSubview: btnn];
    [btnn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchDown];
    [self.navigationController pushViewController:wbVC animated:YES];
    
    
}
-(void)back{
    [wbVC.navigationController popViewControllerAnimated:YES];
    

}
-(void)share{
 
    CATransition *transition = [CATransition animation];
    transition.duration = 0.5;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromTop;
    transition.delegate = self;
    [shareView.layer addAnimation:transition forKey:nil];
    [shareView setHidden:NO];
    
    
    CATransition *transition1 = [CATransition animation];
    transition1.duration = 0.5;
    transition1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition1.type = kCATransitionFade;
    transition1.subtype = kCATransitionFade;
    transition1.delegate = self;
    [blackView.layer addAnimation:transition1 forKey:nil];
    [blackView setHidden:NO];

    CATransition *transition2 = [CATransition animation];
    transition2.duration = 0.5;
    transition2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition2.type = kCATransitionPush;
    transition2.subtype = kCATransitionFromBottom;
    transition2.delegate = self;
    [toolBar.layer addAnimation:transition1 forKey:nil];
    [toolBar setHidden:YES];

}
-(void)dismissShare{
    CATransition *transition = [CATransition animation];
    transition.duration = 0.5;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromBottom;
    transition.delegate = self;
    [shareView.layer addAnimation:transition forKey:nil];
    [shareView setHidden:YES];
    
    CATransition *transition1 = [CATransition animation];
    transition1.duration = 0.5;
    transition1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition1.type = kCATransitionFade;
    transition1.subtype = kCATransitionFade;
    transition1.delegate = self;
    [blackView.layer addAnimation:transition1 forKey:nil];
    [blackView setHidden:YES];
    
    
    CATransition *transition2 = [CATransition animation];
    transition2.duration = 0.5;
    transition2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition2.type = kCATransitionPush;
    transition2.subtype = kCATransitionFromTop;
    transition2.delegate = self;
    [toolBar.layer addAnimation:transition1 forKey:nil];
    [toolBar setHidden:NO];

}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self.view];
    touch_End.x=touchPoint.x;
    touch_End.y=touchPoint.y;
    float distance=touch_End.y-touch_Begin.y;
    [btn.layer removeAllAnimations];
    [toolBar.layer removeAllAnimations];
    if(distance<0)
    {
        if(isShow)
        {
            CATransition *transition = [CATransition animation];
            transition.duration = 0.5;
            transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            transition.type = kCATransitionPush;
            transition.subtype = kCATransitionFromRight;
            transition.delegate = self;
            [btn.layer addAnimation:transition forKey:nil];
            [btn setHidden:YES];
            CATransition *transition1 = [CATransition animation];
            transition1.duration = 0.5;
            transition1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            transition1.type = kCATransitionPush;
            transition1.subtype = kCATransitionFromBottom;
            transition1.delegate = self;
            [toolBar.layer addAnimation:transition1 forKey:nil];
            [toolBar setHidden:YES];
            

        
        isShow=NO;
        }
    }
    else
    {
        if(!isShow)
        {
        isShow=YES;
        CATransition *transition = [CATransition animation];
        transition.duration = 0.5;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        transition.type = kCATransitionPush;
        transition.subtype = kCATransitionFromLeft;
        transition.delegate = self;
        [btn.layer addAnimation:transition forKey:nil];
        [btn setHidden:NO];
        CATransition *transition1 = [CATransition animation];
        transition1.duration = 0.5;
        transition1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        transition1.type = kCATransitionPush;
        transition1.subtype = kCATransitionFromTop;
        transition1.delegate = self;
        [toolBar.layer addAnimation:transition1 forKey:nil];
            [toolBar setHidden:NO];
            
        }
    }
    
    
        
}
-(void)pop{
//    navController *nav=self.navdelegate;
//  
//    [nav popViewControllerAnimated:YES];
    [self.navigationController popViewControllerAnimated:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)sinaShare{
    
}
-(void)wechatShare{
    
}
-(void)wechatFriendsShare{
    
}
-(void)renrenShare{
    
}
-(void)qqShare{
    
}
-(void)qqZoneShare{
    
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
