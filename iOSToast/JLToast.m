//
//  JLToast.m
//  iOSToast
//
//  Created by 廖宗綸 on 2015/5/26.
//  Copyright (c) 2015年 TSUNG-LUN LIAO. All rights reserved.
//

#import "JLToast.h"


#define TOAST_TIME_SHORT   3
#define TOAST_TIME_LONG    5

#define TOAST_SIZE_TINY    9
#define TOAST_SIZE_LITTLE  11
#define TOAST_SIZE_MIDDLE  14
#define TOAST_SIZE_LARGE   16

@interface JLToast ()



@end

@implementation JLToast


+ (JLToast*)makeToastWithString:(NSString*)string withToastTime:(ToastTime)toastTime withToastSize:(ToastSize)toastSize{
    
    
    JLToast *toast = [[JLToast alloc]initWithString:string withToastTime:toastTime withToastSize:toastSize];
    
    
    return toast;
    
}

- (id)initWithString:(NSString*)string withToastTime:(ToastTime)toastTime withToastSize:(ToastSize)toastSize{
    
    self = [super init];
    
    _string         = string;
    _toastTime      = toastTime;
    _toastSize      = toastSize;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kRELEASETOAST
                                                        object:nil
                                                      userInfo:@{@"isToast":[NSNumber numberWithBool:YES]}];
    
    return self;
    
}


- (void)show{
    
    float StringSize = 0;
    switch (_toastSize) {
        case ToastSize_Tiny:
            StringSize = TOAST_SIZE_TINY;
            break;
        case ToastSize_Little:
            StringSize = TOAST_SIZE_LITTLE;
            break;
        case ToastSize_Middle:
            StringSize = TOAST_SIZE_MIDDLE;
            break;
        case ToastSize_Large:
            StringSize = TOAST_SIZE_LARGE;
            break;
        default:
            break;
    }
    
    _toastView  = [[ToastView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)
                                       withString:_string
                                         withSize:StringSize];
    
//    _toastView.frame = CGRectMake([self currentViewController].view.frame.size.width/2 - _toastView.frame.size.width/2,
//                                   [self currentViewController].view.frame.size.height*0.8,
//                                   _toastView.frame.size.width,
//                                   _toastView.frame.size.height);
    
    
    [_toastView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [[self currentViewController].view addSubview:_toastView];

    NSLayoutConstraint *constraintCenterX = [NSLayoutConstraint constraintWithItem:_toastView
                                                                  attribute:NSLayoutAttributeCenterX
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:[self currentViewController].view
                                                                  attribute:NSLayoutAttributeCenterX
                                                                 multiplier:1.0
                                                                   constant:0];
    
    CGFloat originY = -([self currentViewController].view.frame.size.height*0.15-_toastView.frame.size.height/2);
    NSLayoutConstraint *constraintBottom = [NSLayoutConstraint constraintWithItem:_toastView
                                                                  attribute:NSLayoutAttributeBottom
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:[self currentViewController].view
                                                                  attribute:NSLayoutAttributeBottom
                                                                 multiplier:1.0
                                                                   constant:originY];
    
    [[self currentViewController].view addConstraint:constraintCenterX];
    [[self currentViewController].view addConstraint:constraintBottom];
    
    [UIView animateWithDuration:0.3 animations:^{
        //
        _toastView.alpha = 0.7;
        
    } completion:^(BOOL finished) {
        //
    }];
    
        
    [self performSelector:@selector(releaseToast:)
               withObject:nil
               afterDelay:_toastTime == 0 ?TOAST_TIME_SHORT  :TOAST_TIME_LONG];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(releaseToast:)
                                                 name:kRELEASETOAST
                                               object:nil];


}

- (void)releaseToast:(NSNotification*)notification{
    
    
    if (_toastView) {
    
        if ([[notification.userInfo valueForKey:@"isToast"] boolValue]) {
            
            [_toastView removeFromSuperview];
            
            
        }else{
            
            [UIView animateWithDuration:0.3 animations:^{
                //
                _toastView.alpha = 0;
                
            } completion:^(BOOL finished) {
                //
                [_toastView removeFromSuperview];
                
            }];
            
        }

    }
    
}


- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];    
    
}

//- (BOOL)isToasted{
//    
//    NSArray *subViews = [[_controller view] subviews];
//    BOOL isToast = NO;
//    for (id subView in subViews) {
//        
//        if ([subView isKindOfClass:[ToastView class]]) {
//            isToast = YES;
//            return isToast;
//        }
//    }
//    
//    return isToast;
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
