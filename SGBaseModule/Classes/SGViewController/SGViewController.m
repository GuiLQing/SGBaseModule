//
//  SGViewController.m
//  SGTestDemo
//
//  Created by SG on 2019/8/31.
//  Copyright © 2019 SG. All rights reserved.
//

#import "SGViewController.h"
#import "SGNavigationController.h"

@interface SGViewController ()

@end

@implementation SGViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /** 默认添加个背景色 */
    self.view.backgroundColor = UIColor.whiteColor;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    /** 重设系统默认返回按钮内容 */
    self.navigationController.navigationBar.topItem.title = @"";
    
    if (self.isKeepScreenOn) {
        /** 设置屏幕常亮 */
        [UIApplication.sharedApplication setIdleTimerDisabled:YES];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    /** 隐藏键盘 */
    [self.view endEditing:YES];
    /** 关闭屏幕常亮 */
    [UIApplication.sharedApplication setIdleTimerDisabled:NO];
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)] && self.isCloseSideslip) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
        ((SGNavigationController *)self.navigationController).isFullScreenPopDisable = NO;
    }
    else if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)] && !self.isCloseSideslip && self.isCloseFullScreenSideslip) {
        ((SGNavigationController *)self.navigationController).isFullScreenPopDisable = NO;
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    
    if (self.isRegisteredKeyboardObserve) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    }
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)] && self.isCloseSideslip) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
        ((SGNavigationController *)self.navigationController).isFullScreenPopDisable = YES;
    }
    else if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)] && !self.isCloseSideslip && self.isCloseFullScreenSideslip) {
        ((SGNavigationController *)self.navigationController).isFullScreenPopDisable = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"%@ didReceiveMemoryWarning", NSStringFromClass([self class]));
}

- (void)dealloc {
    [NSNotificationCenter.defaultCenter removeObserver:self];
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
}

#pragma mark - Keyboard

- (void)keyboardWillShow:(NSNotification *)notification {
    CGRect keyboardRect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardHeight = [self.view convertRect:keyboardRect fromView:nil].size.height;
    NSTimeInterval duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [self keyboardWillShowWithKeyboardHeight:keyboardHeight duration:duration];
}

- (void)keyboardWillHide:(NSNotification *)notification {
    NSTimeInterval duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [self keyboardWillHideWithDuration:duration];
}

- (void)keyboardWillShowWithKeyboardHeight:(CGFloat)keyboardHeight duration:(NSTimeInterval)duration {
    //override
}

- (void)keyboardWillHideWithDuration:(NSTimeInterval)duration {
    //override
}

@end
