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

- (id)initWithFrame:(CGRect)frame withString:(NSString*)string withSize:(float)size{
    
    self = [super initWithFrame:frame];
    
    UILabel *myToastLabel = [JLDynamicLabel creatLabelWithString:string withSize:size];
    
    self.frame = CGRectMake(0, 0, myToastLabel.frame.size.width+20, myToastLabel.frame.size.height);
    self.layer.cornerRadius = self.frame.size.height/2;
    self.backgroundColor = [UIColor lightGrayColor];
    self.alpha = 0;
    
    myToastLabel.center = self.center;
    
    [self addSubview:myToastLabel];

    NSLayoutConstraint *constraintCenterX = [NSLayoutConstraint constraintWithItem:myToastLabel
                                                                         attribute:NSLayoutAttributeCenterX
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self
                                                                         attribute:NSLayoutAttributeCenterX
                                                                        multiplier:1.0
                                                                          constant:0];
    
    NSLayoutConstraint *constraintCenterY = [NSLayoutConstraint constraintWithItem:myToastLabel
                                                                        attribute:NSLayoutAttributeCenterY
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self
                                                                        attribute:NSLayoutAttributeCenterY
                                                                       multiplier:1.0
                                                                         constant:0];
                                             
    [self addConstraint:constraintCenterX];
    [self addConstraint:constraintCenterY];

    
    return self;
    
}

@end
