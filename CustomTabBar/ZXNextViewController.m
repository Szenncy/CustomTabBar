//
//  ZXNextViewController.m
//  CustomTabBar
//
//  Created by zency on 15/11/19.
//  Copyright © 2015年 Zency. All rights reserved.
//

#import "ZXNextViewController.h"

@interface ZXNextViewController ()

@end

@implementation ZXNextViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
        self.title = @"其他";
        
        self.tabBarItem.image = [UIImage imageNamed:@"tabbar_appfree"];
        
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_appfree_press"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
