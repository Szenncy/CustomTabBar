//
//  ZXBarButton.m
//  03-自定义TabBar
//
//  Created by 证翕 胡 on 15/8/20.
//  Copyright (c) 2015年 证翕 胡. All rights reserved.
//

#import "ZXTabBarItem.h"

//图片的高度
#define kImageViewHeigh 25

//围标的高度
#define kbadgeValueButtonHeight 20

//间隔
#define padding 5

//字体大小
#define fontSize 12

//微标图像的名称
#define bageValue @"numbver_tip"


@interface ZXTabBarItem()

/**
 *  存储图片
 */
@property (weak, nonatomic)UIImageView *imageView;

/**
 *  存储图标
 */
@property (weak, nonatomic)UILabel *titleLabel;

/**
 *  围标按钮
 */
@property (weak, nonatomic)UIButton *badgeValueButton;

@end

@implementation ZXTabBarItem

+ (id)tabBarItem{
    return [[self alloc]init];
}

/**
 *  懒加载imageView
 *
 *  @return <#return value description#>
 */
- (UIImageView *)imageView{
    if (!_imageView) {
        UIImageView *imageView = [[UIImageView alloc]init];
        
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self addSubview:imageView];
        
        _imageView = imageView;
    }
    return _imageView;
}

/**
 *  懒加载标题
 *
 *  @return <#return value description#>
 */
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc]init];
        
        label.textColor = [UIColor whiteColor];
        
        label.font = [UIFont systemFontOfSize:fontSize];
        
        label.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:label];
        
        _titleLabel = label;
    }
    return _titleLabel;
}

/**
 *  懒加载 微标
 *
 *  @return <#return value description#>
 */
- (UIButton *)badgeValueButton{
    if (!_badgeValueButton) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        btn.userInteractionEnabled = NO;
        
        btn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
        
        [self addSubview:btn];
        
        _badgeValueButton = btn;
    }
    return _badgeValueButton;
}

/**
 *  布局
 */
- (void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(0, padding, self.frame.size.width, self.frame.size.height - padding);
    
#warning 这里修改字体的位置
    
    //self.titleLabel.frame = CGRectMake(0, CGRectGetMaxY(self.imageView.frame), self.frame.size.width, self.frame.size.height - CGRectGetMaxY(self.imageView.frame));
    
}

/**
 *  设置属性
 *
 *  @param tabBarItem <#tabBarItem description#>
 */
- (void)setTabBarItem:(UITabBarItem *)tabBarItem{
    
    _tabBarItem = tabBarItem;
    self.imageView.image = tabBarItem.image;
    self.titleLabel.text = tabBarItem.title;
    self.badgeValue = tabBarItem.badgeValue;
    
}

/**
 *  重写setter方法
 *
 *  @param Selected <#Selected description#>
 */
- (void)setSelected:(BOOL)Selected{
    _Selected = Selected;
    if (Selected) {
        self.imageView.image = self.tabBarItem.selectedImage;
        //self.layer.contents = (id)[UIImage imageNamed:@"tab_button_select"].CGImage;
    }else{
        self.imageView.image = self.tabBarItem.image;
       // self.layer.contents = (id)[UIImage imageNamed:@"tab_button"].CGImage;
    }
}

/**
 *  重写setbadgeValue方法
 *
 *  @param badgeValue <#badgeValue description#>
 */
- (void)setBadgeValue:(NSString *)badgeValue{
    _badgeValue = badgeValue;
    
    if (badgeValue.length == 0) {
        return;
    }
    
    CGSize size = [self sizeForDynamicWithTitle:badgeValue andSize:CGSizeMake(self.frame.size.width - self.imageView.center.x + padding, kbadgeValueButtonHeight)];
    
    self.badgeValueButton.titleEdgeInsets = UIEdgeInsetsMake(0, padding, padding, padding);
    
    self.badgeValueButton.frame = CGRectMake(self.frame.size.width * 0.5 + padding, padding, size.width + padding * 3, kbadgeValueButtonHeight);
    
    [self.badgeValueButton setBackgroundImage:[self resizeWithImage:[UIImage imageNamed:bageValue]] forState:UIControlStateNormal];
    
    [self.badgeValueButton setTitle:badgeValue forState:UIControlStateNormal];
}

#pragma mark - 内部逻辑运算

/**
 *  拉伸图片
 *
 *  @param image <#image description#>
 *
 *  @return <#return value description#>
 */
- (UIImage *)resizeWithImage:(UIImage *)image{
    
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(0,kbadgeValueButtonHeight * 0.5,0,kbadgeValueButtonHeight * 0.5)];
}

/**
 *  自动获取字符串视图的大小
 *
 *  @param title <#title description#>
 *  @param size  <#size description#>
 *
 *  @return <#return value description#>
 */
- (CGSize)sizeForDynamicWithTitle:(NSString *)title andSize:(CGSize)size{
 
    return [title boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size;
}


@end
