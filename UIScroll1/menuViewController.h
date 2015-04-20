//
//  menuViewController.h
//  UIScroll1
//
//  Created by eddie on 15-3-21.
//  Copyright (c) 2015年 Test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonalDataViewController.h"
#import "navController.h"
#import "rootViewController.h"
#import "LoginViewController.h"
@interface menuViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property UITableView *menuTableView;
@property id rootDelegate;
@end
