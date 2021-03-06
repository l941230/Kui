//
//  rootViewController.m
//  UIScroll1
//
//  Created by eddie on 15-3-20.
//  Copyright (c) 2015年 Test. All rights reserved.
//

#import "rootViewController.h"

#import "mainViewController.h"

#import "menuViewController.h"
@interface rootViewController ()

@end

@implementation rootViewController
@synthesize scView=_scView;
@synthesize nav;
float DEVICE_WIDTH,DEVICE_HEIGHT;

struct PPoint{
    float x,y;
};
struct PPoint touch_Begin;
struct PPoint touch_Current;
struct PPoint touch_End;
- (void)viewDidLoad {
    [super viewDidLoad];
   
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(enable) name:@"SCROLL_ENABLE" object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(disable) name:@"SCROLL_DISABLE" object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(scrollToMenuNoAnimate) name:@"SCROLL_TO_MENU_NOANIMATE" object:nil];
    
    DEVICE_WIDTH=[UIScreen mainScreen].bounds.size.width;
    DEVICE_HEIGHT=[UIScreen mainScreen].bounds.size.height;
    menuViewController *menuController=[[menuViewController alloc]init];
    [menuController.view setFrame:CGRectMake(0, 0, 0.75*DEVICE_WIDTH, DEVICE_HEIGHT)];
    menuController.rootDelegate=self;
   
  [self addChildViewController:menuController];
    

    
    nav=[[navController alloc]init];
    nav.delegateroot=self;
    view2=[[UIView alloc]initWithFrame:CGRectMake(0.75*DEVICE_WIDTH, 0, DEVICE_WIDTH, DEVICE_HEIGHT)];
    [view2 addSubview: nav.view];
   [self addChildViewController:nav];
    view3 =[[UIView alloc]initWithFrame:CGRectMake(0.75*DEVICE_WIDTH, 0, DEVICE_WIDTH, DEVICE_HEIGHT)];
    [view3 setBackgroundColor:[UIColor blackColor]];
    [view3 setAlpha:0];
    tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(scrollToMenu)];
    
    [view1 setBackgroundColor:[UIColor redColor]];
 

   self.scView=[[MainScroll alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH,DEVICE_HEIGHT)];
    self.scView.isMainState=true;
    self.scView.contentSize=CGSizeMake(DEVICE_WIDTH*1.75  , DEVICE_HEIGHT);
 
    [self.scView setScrollEnabled:YES];

    [self.view addSubview:self.scView];
   
     [self.scView addSubview:menuController.view];
    [self.scView addSubview:view2];
   
    
    self.scView.bounces=NO;
    self.scView.showsVerticalScrollIndicator=NO;
    self.scView.showsHorizontalScrollIndicator=NO;
        tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(returnMain)];
    
     
    self.scView.scrollEnabled=YES;
  
    
    
    self.scView.delegate=self;
  
    self.scView.pagingEnabled=YES;
    [self.scView addSubview:view3];
    [[view3 superview]bringSubviewToFront:view3];
    view3.userInteractionEnabled=YES;
    [self.scView setContentOffset:CGPointMake(0.75*DEVICE_WIDTH, 0)];
    

    
    
    

  
    
}


-(void)enable{
    self.scView.scrollEnabled=YES;
}

-(void)disable{
    self.scView.scrollEnabled=NO;
}
-(void)returnMain{
   [self.scView  setContentOffset:CGPointMake(0.75*DEVICE_WIDTH, 0) animated:YES] ;
    self.scView.isMainState=true;
    
    
    mainViewController *main=nav.delegatemain;
    main.view.userInteractionEnabled=YES;
   [view3 removeGestureRecognizer:tap];
}
-(void) scrollToMenu{
   
   [self.scView  setContentOffset:CGPointMake(0, 0) animated:YES] ;
    self.scView.isMainState=false;
    mainViewController *main=nav.delegatemain;
    main.view.userInteractionEnabled=NO;
    [view3 addGestureRecognizer:tap];
    
}
-(void)scrollToMenuNoAnimate{
    [self.scView  setContentOffset:CGPointMake(0, 0) animated:NO] ;
    self.scView.isMainState=false;
    mainViewController *main=nav.delegatemain;
    main.view.userInteractionEnabled=NO;
    [view3 addGestureRecognizer:tap];

}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if(scrollView.contentOffset.x<0.5*DEVICE_WIDTH)
    {
        [self scrollToMenu];
    }
    
    else
    {
        [self returnMain];
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
   
    float alpha=1.0-scrollView.contentOffset.x/(0.75*DEVICE_WIDTH);
    if(alpha<0.5)
    [view3 setAlpha:alpha];
    else [view3 setAlpha:0.5];
   
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
