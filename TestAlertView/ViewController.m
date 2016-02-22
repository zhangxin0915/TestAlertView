//
//  ViewController.m
//  TestAlertView
//
//  Created by macmini on 16/2/22.
//  Copyright © 2016年 macmini. All rights reserved.
//

#import "ViewController.h"
#import "UIAlertView+AddBlockCallBacks.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
}
-(void)viewDidAppear:(BOOL)animated
{
    
    NSArray * alertArrs = @[@"现金", @"银行卡",@"微信",@"支付宝", @"余额转入"];
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"充值方式" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
    for (int i = 0; i <alertArrs.count; i ++) {
        [alertView addButtonWithTitle:alertArrs[i]];
    }
    [alertView showAlertViewWithHandler:^(UIAlertView *alertView, NSInteger buttonIndex) {
        NSLog(@"buttonIndex ==  %ld",buttonIndex);
    }];
    
    
//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"充值方式" message:nil preferredStyle:UIAlertControllerStyleAlert];
//    NSArray * alertArrs = @[@"现金", @"银行卡",@"微信",@"支付宝", @"余额转入"];
//    for (int i = 0; i <alertArrs.count; i ++) {
//        UIAlertAction *action = [UIAlertAction actionWithTitle:alertArrs[i] style:UIAlertActionStyleDefault handler:nil];
//        [alertController addAction:action];
//    }
//    [self presentViewController:alertController animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
