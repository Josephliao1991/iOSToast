//
//  JLToastStore.m
//  iOSToast
//
//  Created by 廖宗綸 on 2015/5/31.
//  Copyright (c) 2015年 TSUNG-LUN LIAO. All rights reserved.
//

#import "JLToastStore.h"
#import "AppDelegate.h"

@implementation JLToastStore

+ (JLToastStore*)sharedInstance{
    
    static JLToastStore      *_sharedInstance = nil;
    static dispatch_once_t   oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        //
        _sharedInstance = [[JLToastStore alloc]init];
        
    });
    
    return _sharedInstance;
    
}


- (id)init{
    
    self =[super init];
    
    _toastStore = [[NSMutableArray alloc]init];
    
    return self;
    
}

- (void)handlerViewChange{
    
    
}

@end
