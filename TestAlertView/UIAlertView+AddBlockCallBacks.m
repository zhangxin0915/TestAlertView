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
    
    //#import <objc/runtime.h>头文件
    //objc_setAssociatedObject需要四个参数：源对象，关键字，关联的对象和一个关联策略。
    
    //1 源对象alert
    //2 关键字 唯一静态变量key associatedkey
    //3 关联的对象 sender
    //4 关键策略  OBJC_ASSOCIATION_ASSIGN
    //    enum {
    //        OBJC_ASSOCIATION_ASSIGN = 0,           若引用/**< Specifies a weak reference to the associated object. */
    //        OBJC_ASSOCIATION_RETAIN_NONATOMIC = 1, /**< Specifies a strong reference to the associated object.
    //                                                *   The association is not made atomically. */
    //        OBJC_ASSOCIATION_COPY_NONATOMIC = 3,   /**< Specifies that the associated object is copied.
    //                                                *   The association is not made atomically. */
    //        OBJC_ASSOCIATION_RETAIN = 01401,       /**< Specifies a strong reference to the associated object.
    //                                                *   The association is made atomically. */
    //        OBJC_ASSOCIATION_COPY = 01403          /**< Specifies that the associated object is copied.
    //                                                *   The association is made atomically. */
    //    };

    
    //    objc_setAssociatedObject(alert, @"msgstr", message,OBJC_ASSOCIATION_ASSIGN);
    //    //把alert和message字符串关联起来，作为alertview的一部分，关键词就是msgstr，之后可以使用objc_getAssociatedObject从alertview中获取到所关联的对象，便可以访问message或者btn了
    //
    //    //    即实现了关联传值
    //    objc_setAssociatedObject(alert, @"btn property",sender,OBJC_ASSOCIATION_ASSIGN);
    
    objc_setAssociatedObject(self, (__bridge const void *)(handlerRunTimeAccosiationKey), handler, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setDelegate:self];
    [self show];
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //通过 objc_getAssociatedObject获取关联对象
//    NSString  *messageString =objc_getAssociatedObject(alertView, @"msgstr");
    
    
//    UIButton *sender = objc_getAssociatedObject(alertView, @"btn property");
    UIActionAlertViewCallBackHandler completionHandler = objc_getAssociatedObject(self, (__bridge const void *)(handlerRunTimeAccosiationKey));
    
    if (completionHandler != nil)
    {
        completionHandler(alertView, buttonIndex);
    }
    //使用函数objc_removeAssociatedObjects可以断开所有关联。通常情况下不建议使用这个函数，因为他会断开所有关联。只有在需要把对象恢复到“原始状态”的时候才会使用这个函数。
}

@end