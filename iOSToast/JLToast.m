//
//  JLToast.m
//  iOSToast
//
//  Created by 廖宗綸 on 2015/5/26.
//  Copyright (c) 2015年 TSUNG-LUN LIAO. All rights reserved.
//

#import "JLToast.h"
#import "ToastView.h"

#define TOAST_SHORT   3
#define TOAST_LONG    5


@interface JLToast ()

@property (nonatomic, assign) NSString          *string;
@property (nonatomic, assign) ToastTime         toastTime;
@property (nonatomic, assign) UIViewController  *controller;

@end

@implementation JLToast


+ (JLToast*)makeToast{
    
    static JLToast         *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        //
        _sharedInstance = [[JLToast alloc]init];
        
    });
    
    
    return _sharedInstance;
    
}

- (id)init{
    
    self = [super init];
    
    _string         = @"";
    _toastTime      = ToastTime_Short;
    _controller     = nil;
    
    return self;
    
}

- (void)SetToastWithString:(NSString*)string withToastTime:(ToastTime)toastTime withController:(UIViewController*)controller{
    
    _string         = string;
    _toastTime      = toastTime;
    _controller     = controller;
    
}

- (void)show{
    
    ToastView *toastBefore = [self isToasted];
    if (toastBefore) {
        NSLog(@"AllReady Tosat");
//        [toastBefore removeFromSuperview];
        [self releaseToast:toastBefore];
    }
    
    UIView *myToastView  = [[ToastView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)
                                                    withString:_string];
    
    myToastView.frame = CGRectMake(_controller.view.frame.size.width/2 - myToastView.frame.size.width/2,
                                   _controller.view.frame.size.height*0.8,
                                   myToastView.frame.size.width,
                                   myToastView.frame.size.height);
    
    [_controller.view addSubview:myToastView];
    
    [UIView animateWithDuration:0.3 animations:^{
        //
        myToastView.alpha = 0.7;
        
    } completion:^(BOOL finished) {
        //
        [self performSelector:@selector(releaseToast:)
                   withObject:myToastView
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

- (ToastView*)isToasted{
    
    NSArray *subViews = [[_controller view] subviews];
    
    for (id subView in subViews) {
        
        if ([subView isKindOfClass:[ToastView class]]) {
            return subView;
        }
        
    }
    
    return nil;
}


@end
