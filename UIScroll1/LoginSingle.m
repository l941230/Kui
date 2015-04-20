//
//  LoginSingle.m
//  UIScroll1
//
//  Created by eddie on 15-4-20.
//  Copyright (c) 2015年 Test. All rights reserved.
//

#import "LoginSingle.h"

@implementation LoginSingle
@synthesize isLogined;
static LoginSingle *sharedInstance = nil;

+(LoginSingle *)newinstance{
    if (sharedInstance==nil) {
        sharedInstance=[[LoginSingle alloc]init];
        sharedInstance.isLogined=NO;
    }
    return sharedInstance;
}
@end
