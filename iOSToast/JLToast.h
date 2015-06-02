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


typedef NS_ENUM(NSInteger,ToastTime){
    
    ToastTime_Short,
    ToastTime_Long
    
};

typedef NS_ENUM(NSInteger,ToastSize){
    
    ToastSize_Tiny,
    ToastSize_Little,
    ToastSize_Middle,
    ToastSize_Large,
    
};

@interface JLToast : NSObject

@property (nonatomic, assign) NSString          *string;
@property (nonatomic, assign) ToastTime         toastTime;
@property (nonatomic, assign) ToastSize         toastSize;
@property (nonatomic, strong) ToastView         *toastView;


+ (JLToast*)makeToastWithString:(NSString*)string withToastTime:(ToastTime)toastTime withToastSize:(ToastSize)toastSize;

- (void)show;

@end
