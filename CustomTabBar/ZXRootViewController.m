//
//  ZXRootViewController.m
//  03-自定义TabBar
//
//  Created by 证翕 胡 on 15/8/20.
//  Copyright (c) 2015年 证翕 胡. All rights reserved.
//

#import "ZXRootViewController.h"

#define kTabBarHeight 49

@interface ZXRootViewController ()<ZXTabBarViewDelegate>

@end

@implementation ZXRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
#warning step 2.
        //1.装载子控制器
        
        /**
         
         用这种方法封装,如果以后的项目需要用到tabbar的时候,就可以直接拿来用,不会受到.h文件的影响,@"ZXMainStoryboard"等可以随意跟换
         
         */
        
        self.viewControllers = [self controllerWithStoryBoardName:@[@"ZXMainStoryboard",@"ZXNextStoryboard"]];
        
        //隐藏系统tabBar
        self.tabBar.hidden = YES;
    }
    
    return self;
}

#pragma mark - 
#pragma mark 懒加载

-(ZXTabBarView *)tabBarView{
    if (!_tabBarView) {
        ZXTabBarView *tabBar = [ZXTabBarView tabBarViewWithDelegate:self];
        
        tabBar.frame = CGRectMake(0, self.view.frame.size.height - kTabBarHeight, self.view.frame.size.width, kTabBarHeight);
        
        tabBar.layer.contents = (id)[UIImage imageNamed:@"tabbar_bg"].CGImage;
        
        _tabBarView = tabBar;
        
        [self.view addSubview:tabBar];
        
    }
    return _tabBarView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


#warning 重写setViewController方法

- (void)setViewControllers:(NSArray *)viewControllers{
    
    //这里要换位置,先有装载数据才行
    NSMutableArray *objs = [NSMutableArray array];
    
    for (int i = 0; i < viewControllers.count; i++) {
        UIViewController *v = viewControllers[i];
        [objs addObject:v.tabBarItem];
    }
    
    self.tabBarView.tabBarItems = objs;
    
    [super setViewControllers:viewControllers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)tabBarView:(ZXTabBarView *)tabBarView andSelectedIndex:(NSInteger)index{
    self.selectedIndex = index;
}

#warning 重写setSelectedIndex

- (void)setSelectedIndex:(NSUInteger)selectedIndex{
    [super setSelectedIndex:selectedIndex];
    [self.tabBarView setCurrentSelected:selectedIndex];
}

#warning step 3. 获取装载好控制器的数组

- (NSArray *)controllerWithStoryBoardName:(NSArray *)name{
    
    NSMutableArray *objs = [NSMutableArray array];
    
    for (NSString *nibname in name) {
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:nibname bundle:nil];
        
        UINavigationController *nav = [storyBoard instantiateInitialViewController];
        
        [objs addObject:nav];
    }
    
    return objs;
}

@end
