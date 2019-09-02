//
//  SGViewController.h
//  SGTestDemo
//
//  Created by SG on 2019/8/31.
//  Copyright © 2019 SG. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SGViewController : UIViewController

/** 是否保持屏幕常亮 */
@property (nonatomic, assign) BOOL isKeepScreenOn;
/** 是否注册键盘通知监听 */
@property (nonatomic, assign) BOOL isRegisteredKeyboardObserve;
/** 是否关闭侧滑iOS默认手势，默认不关闭 */
@property (nonatomic, assign) BOOL isCloseSideslip;
/** 是否关闭全屏滑动，当侧滑关闭的时候，全屏滑动失效，默认关闭 */
@property (nonatomic, assign) BOOL isCloseFullScreenSideslip;

/** 键盘将要显示 */
- (void)keyboardWillShowWithKeyboardHeight:(CGFloat)keyboardHeight duration:(NSTimeInterval)duration;
/** 键盘将要收起 */
- (void)keyboardWillHideWithDuration:(NSTimeInterval)duration;

@end

NS_ASSUME_NONNULL_END
