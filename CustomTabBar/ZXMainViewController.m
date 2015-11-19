//
//  ZXMainViewController.m
//  CustomTabBar
//
//  Created by zency on 15/11/19.
//  Copyright © 2015年 Zency. All rights reserved.
//

#import "ZXMainViewController.h"
#import "ZXRootViewController.h"

@interface ZXMainViewController ()

@property (weak, nonatomic)UIImageView *backImageView;

@end

@implementation ZXMainViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
        //设置标题
        self.title = @"首页";
        
        //设置未被选中的时候的图片
        self.tabBarItem.image = [UIImage imageNamed:@"tabbar_account"];
        
        //设置选中的时候的图片
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_account_press"];
    }
    return self;
}

#pragma mark - 懒加载

- (UIImageView *)backImageView{
    if (!_backImageView) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
        
        [self.view addSubview:imageView];
        
        _backImageView = imageView;
    }
    return _backImageView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    ZXRootViewController *rootVC = (ZXRootViewController *)self.tabBarController;
    
    rootVC.tabBarView.hidden = NO;
    
    [self.backImageView removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)BtnTouch:(id)sender {
    
    UIViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateInitialViewController];
    
    //截取屏幕
    [self cutScreem];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

/**
 *  截取屏幕的方法
 */
- (void)cutScreem{
    
    UIGraphicsBeginImageContextWithOptions(self.tabBarController.view.bounds.size, YES, 0.0);
    
    //截取层的画面
    
    [self.tabBarController.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    //将图片给铺满整个视图
    
    self.backImageView.image = image;
}


@end
