//
//  LoginViewController.m
//  UIScroll1
//
//  Created by eddie on 15-4-20.
//  Copyright (c) 2015年 Test. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
{
    UITextField *passWord;
    UITextField *loginName;
    UIImageView *logoImg;
    CALayer *bottomPBorder;
     CALayer *bottomFBorder;
    CGRect originPFrame;
    CGRect originLFrame;
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIButton *backBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, [UIApplication sharedApplication].statusBarFrame.size.height, 0.1*self.view.frame.size.width, 0.1*self.view.frame.size.width)];
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
   [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backToMenu) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:backBtn];
    
    
    logoImg=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0.2*self.view.frame.size.height, 0.2*self.view.frame.size.width, 0.2*self.view.frame.size.height)];
    logoImg.center=CGPointMake(self.view.center.x, logoImg.center.y) ;
    logoImg.image=[UIImage imageNamed:@"loginlogo.jpg"];
    [self.view addSubview:logoImg];
    
    passWord=[[UITextField alloc]initWithFrame:CGRectMake(0, 0.59*self.view.frame.size.height, 0.8*self.view.frame.size.width, 0.06*self.view.frame.size.height)];
    
    passWord.delegate=self;
    passWord.center=CGPointMake(self.view.center.x, passWord.center.y) ;
    passWord.placeholder=@" 请输入密码";
    [passWord setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    originPFrame=passWord.frame;
  
    [self.view addSubview:passWord];
    

    
    
       loginName=[[UITextField alloc]initWithFrame:CGRectMake(passWord.frame.origin.x, 0.5*self.view.frame.size.height, 0.8*self.view.frame.size.width, 0.06*self.view.frame.size.height)];
    originLFrame=loginName.frame;
    loginName.delegate=self;
    /*
//    [loginName setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    
//    NSLayoutConstraint *constraint=[NSLayoutConstraint constraintWithItem:loginName attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:passWord attribute:NSLayoutAttributeTop multiplier:1 constant:-0.03*self.view.frame.size.height];
//    [self.view addConstraint:constraint];
//    
//  constraint=[NSLayoutConstraint constraintWithItem:loginName attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:passWord attribute:NSLayoutAttributeTop multiplier:1 constant:-0.09*self.view.frame.size.height];
//    [self.view addConstraint:constraint];
//    
//    constraint=[NSLayoutConstraint constraintWithItem:loginName attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:passWord attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
//    [self.view addConstraint:constraint];
//    constraint=[NSLayoutConstraint constraintWithItem:loginName attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:passWord attribute:NSLayoutAttributeRight multiplier:1 constant:0];
//    [self.view addConstraint:constraint];
//    
    
   */
   
    loginName.placeholder=@" 手机号/邮箱";
  
    [loginName setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
      [self.view addSubview:loginName];
    UIButton *loginBtn=[[UIButton alloc]initWithFrame:CGRectMake(passWord.frame.origin.x, passWord.frame.origin.y+passWord.frame.size.height+0.03*self.view.frame.size.height, passWord.frame.size.width, passWord.frame.size.height)];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setBackgroundColor:[UIColor blueColor]];
    [loginBtn addTarget:self action:@selector(loginIn) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:loginBtn];
    
    
    bottomPBorder = [CALayer layer];
    float height=passWord.frame.size.height-1.0f;
    float width=passWord.frame.size.width;
    bottomPBorder.frame = CGRectMake(0.0f, height, width, 0.5f);
    bottomPBorder.backgroundColor = [UIColor grayColor].CGColor;
   
    [passWord.layer addSublayer:bottomPBorder];
    
    bottomFBorder = [CALayer layer];
       bottomFBorder.frame = CGRectMake(0.0f, height, width, 0.5f);
    bottomFBorder.backgroundColor = [UIColor grayColor].CGColor;
    

    [loginName.layer addSublayer:bottomFBorder];
  
    
}
-(void)backToMenu{
//    CATransition *transition = [CATransition animation];
//    transition.duration = 0.5;
//    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    transition.type = kCATransitionPush;
// transition.subtype = kCATransitionFromLeft;
//    transition.delegate = self;
//   [self.navigationController.view.layer addAnimation:transition forKey:nil];
//    [self.view.layer addAnimation:transition forKey:nil];
//    [self.navigationController popViewControllerAnimated:NO];
   
     [self.navigationController popViewControllerAnimated:NO];
}
-(BOOL)loginIn{
    return YES;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
 
    
    return YES;
    
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
   
    return YES;
}
- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController.navigationBar setHidden:YES];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyUp:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyDown:) name:UIKeyboardWillHideNotification object:nil];
}
-(void)viewWillDisappear:(BOOL)animated{
    [self.navigationController.navigationBar setHidden:NO];
    
}
-(void)viewDidDisappear:(BOOL)animated
{
     [[NSNotificationCenter defaultCenter]postNotificationName:@"SCROLL_TO_MENU_NOANIMATE" object:nil];
}

-(void)keyUp:(NSNotification *)notification{
    NSValue *keyboardObject = [[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey];
    
    CGRect keyboardRect;
    [keyboardObject getValue:&keyboardRect];
    
    NSNumber *duration = [notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [notification.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    
    
   
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:[duration doubleValue]];
    [UIView setAnimationCurve:[curve intValue]];
    [UIView setAnimationDelegate:self];
//    [self.view setFrame:CGRectMake(0, parent.view.frame.size.height -keyboardRect.size.height-50, parent.view.frame.size.width , 50)];
//
    
    [passWord setFrame:CGRectMake(passWord.frame.origin.x,keyboardRect.origin.y-passWord.frame.size.height, passWord.frame.size.width, passWord.frame.size.height)];
    [loginName setFrame:CGRectMake(passWord.frame.origin.x, passWord.frame.origin.y-0.09*self.view.frame.size.height, loginName.frame.size.width, loginName.frame.size.height)];
    [UIView commitAnimations];
    
    
}
-(void)keyDown:(NSNotification *)notification{
    
    NSNumber *duration = [notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [notification.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    

    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:[duration doubleValue]];
    [UIView setAnimationCurve:[curve intValue]];
    [UIView setAnimationDelegate:self];
    [passWord setFrame:originPFrame];
    [loginName setFrame:originLFrame];
    [UIView commitAnimations];
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if([loginName isFirstResponder]){
        [loginName resignFirstResponder];
    }
    else if([passWord isFirstResponder])
    {
        [passWord resignFirstResponder];
    }
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
