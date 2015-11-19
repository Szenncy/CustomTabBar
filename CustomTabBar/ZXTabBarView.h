//
//  ZXTabBarView.h
//  03-自定义TabBar
//
//  Created by 证翕 胡 on 15/8/20.
//  Copyright (c) 2015年 证翕 胡. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZXTabBarView;
@protocol ZXTabBarViewDelegate <NSObject>

/**
 *  点击按钮之后触发
 *
 *  @param tabBarView <#tabBarView description#>
 *  @param index      <#index description#>
 */
- (void)tabBarView:(ZXTabBarView *)tabBarView andSelectedIndex:(NSInteger)index;

@end

@interface ZXTabBarView : UIView


#warning 这个获取每个控制器的tabBarItem 因为每个控制器都有tabBarItem
/**
 *  存储控制器的BarButtonItem
 */
@property (strong, nonatomic)NSArray *tabBarItems;

/**
 *  代理
 */
@property (assign, nonatomic)id <ZXTabBarViewDelegate> delegate;

/**
 *  构造方法
 *
 *  @return <#return value description#>
 */
+ (id)tabBarView;

/**
 *  构造方法
 *
 *  @param delegate 实现代理方法
 *
 *  @return <#return value description#>
 */
+ (id)tabBarViewWithDelegate:(id <ZXTabBarViewDelegate>)delegate;

/**
 *  设置当前被选中
 *
 *  @param selectedIndex <#selectedIndex description#>
 */
- (void)setCurrentSelected:(NSUInteger)selectedIndex;

@end
