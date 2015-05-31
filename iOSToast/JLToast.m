//
//  JLToast.m
//  iOSToast
//
//  Created by 廖宗綸 on 2015/5/26.
//  Copyright (c) 2015年 TSUNG-LUN LIAO. All rights reserved.
//

#import "JLToast.h"
#import "ToastView.h"
#import "JLToastConstant.h"

#define TOAST_SHORT   3
#define TOAST_LONG    5


@interface JLToast ()

@property (nonatomic, assign) NSString          *string;
@property (nonatomic, assign) ToastTime         toastTime;
@property (nonatomic, assign) UIViewController  *controller;
@property (nonatomic, strong) ToastView         *toastView;

@end

@implementation JLToast


+ (JLToast*)makeToastWithString:(NSString*)string withToastTime:(ToastTime)toastTime{
    
//    static JLToast         *_sharedInstance = nil;
//    static dispatch_once_t oncePredicate;
//    
//    dispatch_once(&oncePredicate, ^{
//        //
//        _sharedInstance = [[JLToast alloc]init];
//        
//    });
    
    JLToast *toast = [[JLToast alloc]initWithString:string withToastTime:toastTime];
    
    
    return toast;
    
}

- (id)initWithString:(NSString*)string withToastTime:(ToastTime)toastTime{
    
    self = [super init];
    
    _string         = string;
    _toastTime      = toastTime;
    _controller     = [self currentViewController];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(releaseToast:)
//                                                 name:kRELEASETOASTREUQEST
//                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kRELEASETOAST
                                                        object:nil
                                                      userInfo:nil];
    
    return self;
    
}


- (void)show{
    
//    ToastView *toastBefore = [self isToasted];
//    if (toastBefore) {
//        NSLog(@"AllReady Tosat");
////        [toastBefore removeFromSuperview];
//        [self releaseToast:toastBefore];
//    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(releaseToast:)
                                                 name:kRELEASETOAST
                                               object:nil];
    
    _toastView  = [[ToastView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)
                                      withString:_string];
    
    _toastView.frame = CGRectMake(_controller.view.frame.size.width/2 - _toastView.frame.size.width/2,
                                   _controller.view.frame.size.height*0.8,
                                   _toastView.frame.size.width,
                                   _toastView.frame.size.height);
    
    [_controller.view addSubview:_toastView];
    
    [UIView animateWithDuration:0.3 animations:^{
        //
        _toastView.alpha = 0.7;
        
    } completion:^(BOOL finished) {
        //
        [self performSelector:@selector(releaseToast:)
                   withObject:_toastView
                   afterDelay:_toastTime == 0 ?TOAST_SHORT  :TOAST_LONG];
        
    }];

}

- (void)releaseToast:(UIView*)myToastView{
    
    if (myToastView) {
        
        [UIView animateWithDuration:0.3 animations:^{
            //
            myToastView.alpha = 0;
            
        } completion:^(BOOL finished) {
            //
            [myToastView removeFromSuperview];
            
        }];
        
    }
    
}

- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];    
    
}

//- (ToastView*)isToasted{
//    
//    NSArray *subViews = [[_controller view] subviews];
//    
//    for (id subView in subViews) {
//        
//        if ([subView isKindOfClass:[ToastView class]]) {
//            return subView;
//        }
//        
//    }
//    
//    return nil;
//}

#pragma mark - Find Current Present ViewController
- (UIViewController*) findBestViewController:(UIViewController*)vc {
    
    if (vc.presentedViewController) {
        
        // Return presented view controller
        return [self findBestViewController:vc.presentedViewController];
        
    } else if ([vc isKindOfClass:[UISplitViewController class]]) {
        
        // Return right hand side
        UISplitViewController* svc = (UISplitViewController*) vc;
        if (svc.viewControllers.count > 0)
            return [self findBestViewController:svc.viewControllers.lastObject];
        else
            return vc;
        
    } else if ([vc isKindOfClass:[UINavigationController class]]) {
        
        // Return top view
        UINavigationController* svc = (UINavigationController*) vc;
        if (svc.viewControllers.count > 0)
            return [self findBestViewController:svc.topViewController];
        else
            return vc;
        
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        
        // Return visible view
        UITabBarController* svc = (UITabBarController*) vc;
        if (svc.viewControllers.count > 0)
            return [self findBestViewController:svc.selectedViewController];
        else
            return vc;
        
    } else {
        
        // Unknown view controller type, return last child view controller
        return vc;
        
    }
    
}

- (UIViewController*) currentViewController {
    
    // Find best view controller
    UIViewController* viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    return [self findBestViewController:viewController];
    
}


@end
