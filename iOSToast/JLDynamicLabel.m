//
//  JLDynamicLabel.m
//  iOSToast
//
//  Created by 廖宗綸 on 2015/5/26.
//  Copyright (c) 2015年 TSUNG-LUN LIAO. All rights reserved.
//

#import "JLDynamicLabel.h"

@implementation JLDynamicLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (JLDynamicLabel*)creatLabelWithString:(NSString*)string withSize:(float)size{
    
    JLDynamicLabel *label = [[JLDynamicLabel alloc]initWithFrame:CGRectMake(0, 0, 0, 0) WithString:string withSize:size];
    
    return label;
}

- (id)initWithFrame:(CGRect)frame WithString:(NSString*)string withSize:(float)size{
    
    self = [super initWithFrame:frame];
    
    self.text               = string;
    self.textAlignment      = NSTextAlignmentCenter;
    self.font = [UIFont systemFontOfSize:size];
    
    [self setNumberOfLines:0];
    self.lineBreakMode =NSLineBreakByWordWrapping;
    
    CGRect expectedLabelSize = [string boundingRectWithSize:self.frame.size
                                                    options:NSStringDrawingUsesLineFragmentOrigin
                                                 attributes:@{NSFontAttributeName: [self font]}
                                                    context:nil];
    
//    NSLog(@"Label Size W=%f H=%f",expectedLabelSize.size.width,expectedLabelSize.size.height);
    
    self.frame = expectedLabelSize;
    
    return self;
    
}


@end
