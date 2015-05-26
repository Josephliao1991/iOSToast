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


@end

@implementation JLToast


+ (JLToast*)makeToast{
    
    static JLToast         *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        //
        _sharedInstance = [[JLToast alloc] init];
        
    });
    
    return _sharedInstance;
    
}

- (id)init{
    
    self = [super init];
    
    
    return self;
    
}



- (void)showWithString:(NSString*)string withToastTime:(ToastTime)toastTime withController:(UIViewController*)controller{
    
    UIView *myToastView  = [[ToastView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)
                                                    withString:string];
    
    myToastView.frame = CGRectMake(controller.view.frame.size.width/2 - myToastView.frame.size.width/2,
                                   controller.view.frame.size.height*0.8,
                                   myToastView.frame.size.width,
                                   myToastView.frame.size.height);
    
    [controller.view addSubview:myToastView];
    
    [UIView animateWithDuration:0.3 animations:^{
        //
        myToastView.alpha = 0.7;
        
    } completion:^(BOOL finished) {
        //
        [self performSelector:@selector(releaseToast:)
                   withObject:myToastView
                   afterDelay:toastTime == 0 ?TOAST_SHORT  :TOAST_LONG];
        
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

@end
