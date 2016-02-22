//
//  UIAlertView+AddBlockCallBacks.m
//  TestAlertView
//
//  Created by macmini on 16/2/22.
//  Copyright © 2016年 macmini. All rights reserved.
//

#import "UIAlertView+AddBlockCallBacks.h"
#import <objc/runtime.h>

@implementation UIAlertView (AddBlockCallBacks)
static NSString *handlerRunTimeAccosiationKey = @"alertViewCreateByGuanHOn20131017";

- (void)showAlertViewWithHandler:(UIActionAlertViewCallBackHandler)handler
{
    objc_setAssociatedObject(self, (__bridge const void *)(handlerRunTimeAccosiationKey), handler, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setDelegate:self];
    [self show];
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIActionAlertViewCallBackHandler completionHandler = objc_getAssociatedObject(self, (__bridge const void *)(handlerRunTimeAccosiationKey));
    
    if (completionHandler != nil)
    {
        completionHandler(alertView, buttonIndex);
    }
    //使用函数objc_removeAssociatedObjects可以断开所有关联。通常情况下不建议使用这个函数，因为他会断开所有关联。只有在需要把对象恢复到“原始状态”的时候才会使用这个函数。
}

@end