//
//  JLToastStore.h
//  iOSToast
//
//  Created by 廖宗綸 on 2015/5/31.
//  Copyright (c) 2015年 TSUNG-LUN LIAO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JLToastStore : NSObject

@property (nonatomic, strong) NSMutableArray *toastStore;

+ (JLToastStore*)sharedInstance;

@end
