//
//  ToastView.m
//  iOSToast
//
//  Created by 廖宗綸 on 2015/5/26.
//  Copyright (c) 2015年 TSUNG-LUN LIAO. All rights reserved.
//

#import "ToastView.h"
#import "JLDynamicLabel.h"

@implementation ToastView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame withString:(NSString*)string{
    
    self = [super initWithFrame:frame];
    
    UILabel *myToastLabel = [[JLDynamicLabel alloc]initWithFrame:CGRectMake(0, 0, 10, 10)
                                                      withString:string];
    
    self.frame = CGRectMake(0, 0, myToastLabel.frame.size.width+10, myToastLabel.frame.size.height);
    self.layer.cornerRadius = self.frame.size.height/2;
    self.backgroundColor = [UIColor grayColor];
    self.alpha = 0;
    
    myToastLabel.center = self.center;
    
    [self addSubview:myToastLabel];
    
    return self;
    
}

@end
