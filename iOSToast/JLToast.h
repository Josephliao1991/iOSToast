//
//  JLToast.h
//  iOSToast
//
//  Created by 廖宗綸 on 2015/5/26.
//  Copyright (c) 2015年 TSUNG-LUN LIAO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ToastView.h"
#import "JLToastConstant.h"
#import "JLToastStore.h"

typedef NS_ENUM(NSInteger,ToastTime){
    
    ToastTime_Short,
    ToastTime_Long
    
};

@interface JLToast : NSObject

@property (nonatomic, assign) NSString          *string;
@property (nonatomic, assign) ToastTime         toastTime;
@property (nonatomic, assign) UIViewController  *controller;
@property (nonatomic, strong) ToastView         *toastView;


+ (JLToast*)makeToastWithString:(NSString*)string withToastTime:(ToastTime)toastTime;

- (void)show;

@end
