
//
//  UICopyLable.m
//  UIScroll1
//
//  Created by eddie on 15-4-17.
//  Copyright (c) 2015年 Test. All rights reserved.
//

#import "UICopyLable.h"
#import "HaveHotTableVC.h"
@implementation UICopyLable
@synthesize isLongPressing;
@synthesize cellDelegate;
@synthesize tableDelegate;
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self addLongPressgesture];
       // NSLog(@"coppppppppppppppppppppppppyyyyyyyyyyyy");
        isLongPressing=NO;
    }
    return self;
}
-(void)addLongPressgesture{
    self.userInteractionEnabled = YES;  //用户交互的总开关
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
   
   [self addGestureRecognizer:longPress];
}
-(void)handleLongPress:(UIGestureRecognizer*) recognizer{
  
    [self setBackgroundColor:[UIColor grayColor]];
    [self becomeFirstResponder];
    UIMenuController *menu = [UIMenuController sharedMenuController];
  
    
    
    UIMenuItem *copyItem=[[UIMenuItem alloc]initWithTitle:@"复制" action:@selector(copyStrOnLable)];
    menu.menuItems=nil;
    menu.menuItems=[NSArray arrayWithObjects:copyItem, nil];
    [menu setTargetRect:self.frame inView:self.superview];
    
    [menu setMenuVisible:YES animated:YES];
    
      [self setBackgroundColor:[UIColor whiteColor]];
}
-(BOOL)canBecomeFirstResponder{
    return YES;
}
-(BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    if(action==@selector(copyStrOnLable))
    return YES;
    else
        return NO;
}
-(void)copyStrOnLable{
    UIPasteboard *pboard = [UIPasteboard generalPasteboard];
    pboard.string = self.text;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self setBackgroundColor:[UIColor grayColor]];
    NSLog(@"begin");
}
-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"cancle");
    [self setBackgroundColor:[UIColor whiteColor]];
   
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self setBackgroundColor:[UIColor whiteColor]];
    NSLog(@"end");
    UITableViewCell *cell=cellDelegate;
    HaveHotTableVC *HotVC=tableDelegate;
    [HotVC.tableView setContentOffset:cell.frame.origin animated:YES];
    [HotVC.textView becomeFirstResponder];
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
}
@end
