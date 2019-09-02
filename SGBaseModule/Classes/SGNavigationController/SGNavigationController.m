//
//  SGNavigationController.m
//  SGTestDemo
//
//  Created by SG on 2019/8/31.
//  Copyright © 2019 SG. All rights reserved.
//

#import "SGNavigationController.h"
#import "SGBarButtonItem.h"

@interface SGNavigationController () <UIGestureRecognizerDelegate, UINavigationBarDelegate>

/** 自定义全屏返回手势 */
@property (nonatomic, strong) UIPanGestureRecognizer *fullScreenPopGestureRecognizer;

@end

@implementation SGNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**
     在NavigationController堆栈内的UIViewController可以支持右滑手势
     即在屏幕左边一滑，屏幕就会返回。
     但是在自定义返回按钮这个手势就会失效。
     解决方法：重新设置手势的delegate
     */
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    
    /** 按钮和标题以及字体颜色、大小设置 */
    self.navigationBar.tintColor = UIColor.whiteColor;
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : UIColor.whiteColor, NSFontAttributeName : [UIFont systemFontOfSize:18.0f]};
    
    /** 获取系统自带滑动手势的target对象 */
    id target = self.interactivePopGestureRecognizer.delegate;
    /** 创建全屏滑动手势，调用系统自带滑动手势的target的action方法 */
    self.fullScreenPopGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:target action:NSSelectorFromString(@"handleNavigationTransition:")];
    /** 设置手势代理，拦截手势触发 */
    self.fullScreenPopGestureRecognizer.delegate = self;
    /** 给导航控制器的view添加全屏滑动手势 */
    [self.view addGestureRecognizer:self.fullScreenPopGestureRecognizer];
}

- (void)setIsFullScreenPopDisable:(BOOL)isFullScreenPopDisable {
    _isFullScreenPopDisable = isFullScreenPopDisable;
    
    self.fullScreenPopGestureRecognizer.enabled = !isFullScreenPopDisable;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count == 1) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    viewController.navigationItem.leftBarButtonItems = [SGBarButtonItem barButtonItemsWithTypes:@[@(SGBarButtonItemTypeBack)] delegate:viewController];
    [super pushViewController:viewController animated:animated];
    self.interactivePopGestureRecognizer.enabled = NO;
}

#pragma mark - UIGestureRecognizerDelegate

/**
 什么时候调用：每次触发手势之前都会询问下代理，是否触发。
 作用：拦截手势触发
 */
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    /**
     注意：只有非根控制器才有滑动返回功能，根控制器没有。
     判断导航控制器是否只有一个子控制器，如果只有一个子控制器，肯定是根控制器
     这里有两个条件不允许手势执行，1、当前控制器为根控制器；2、如果这个push、pop动画正在执行（私有属性）
     */
    return self.viewControllers.count !=1 && ![[self valueForKey:@"_isTransitioning"] boolValue];
}

/** 修改状态栏 */
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
