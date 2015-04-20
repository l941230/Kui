//
//  HotTableVC.h
//  UIScroll1
//
//  Created by eddie on 15-4-19.
//  Copyright (c) 2015年 Test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICopyLable.h"
@interface HotTableVC : UITableViewController<UITextViewDelegate>
@property  UITextView *textView;
@property id parentDelegate;

@end
