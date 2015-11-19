//
//  ViewController.m
//  CustomTabBar
//
//  Created by zency on 15/11/19.
//  Copyright © 2015年 Zency. All rights reserved.
//

#import "ViewController.h"
#import "ZXRootViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ZXRootViewController *rootVC = (ZXRootViewController *)self.tabBarController;
    
    rootVC.tabBarView.hidden = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
