//
//  TableViewController.h
//  UIScroll1
//
//  Created by eddie on 15-3-29.
//  Copyright (c) 2015年 Test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableController : UITableViewController<UIScrollViewDelegate>
@property id mainDelegate;
@property BOOL isLoading;
@end
