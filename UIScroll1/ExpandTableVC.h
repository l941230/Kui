//
//  ExpandTableVC.h
//  点击按钮出现下拉列表
//
//  Created by 杜甲 on 14-3-26.
//  Copyright (c) 2014年 杜甲. All rights reserved.
//



#import <UIKit/UIKit.h>
@protocol ExpandTableVCDelegate <NSObject>

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
//
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

@end
@interface ExpandTableVC : UITableViewController
@property (strong , nonatomic) NSArray* m_ContentArr;

@property (assign , nonatomic) id<ExpandTableVCDelegate> delegate_ExpandTableVC;
@end
