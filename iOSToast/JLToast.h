//
//  JLToast.h
//  iOSToast
//
//  Created by 廖宗綸 on 2015/5/26.
//  Copyright (c) 2015年 TSUNG-LUN LIAO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,ToastTime){
    
    ToastTime_Short,
    ToastTime_Long
    
};

@interface JLToast : NSObject

+ (JLToast*)makeToastWithString:(NSString*)string withToastTime:(ToastTime)toastTime;

- (void)show;

@end
