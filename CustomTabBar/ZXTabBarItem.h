//
//  ZXBarButton.h
//  03-自定义TabBar
//
//  Created by 证翕 胡 on 15/8/20.
//  Copyright (c) 2015年 证翕 胡. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXTabBarItem : UIControl

/**
 *  是否被选中
 */
@property (assign,nonatomic,getter=isSelected)BOOL Selected;

/**
 *  微标显示
 */
@property (copy,nonatomic)NSString *badgeValue;

/**
 *  记录控制器的tabBarItem
 */
@property (strong,nonatomic)UITabBarItem *tabBarItem;

/**
 *  构造方法
 *
 *  @return <#return value description#>
 */
+ (id)tabBarItem;

/**
 *  设置tabBarItem
 *
 *  @param tabBarItem <#tabBarItem description#>
 */
//- (void)setTabBarItem:(UITabBarItem *)tabBarItem;
@end
