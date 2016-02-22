//
//  UIAlertView+AddBlockCallBacks.h
//  TestAlertView
//
//  Created by macmini on 16/2/22.
//  Copyright © 2016年 macmini. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^UIActionAlertViewCallBackHandler)(UIAlertView * alertView, NSInteger buttonIndex);

@interface UIAlertView (AddBlockCallBacks)<UIAlertViewDelegate>
- (void)showAlertViewWithHandler:(UIActionAlertViewCallBackHandler)handler;
@end
