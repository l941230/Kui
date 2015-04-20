//
//  UICopyLable.h
//  UIScroll1
//
//  Created by eddie on 15-4-17.
//  Copyright (c) 2015年 Test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICopyLable : UILabel
@property BOOL isLongPressing;
@property id cellDelegate;
@property id tableDelegate;
@end
