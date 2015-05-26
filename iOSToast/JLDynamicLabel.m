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
- (id)initWithFrame:(CGRect)frame withString:(NSString*)string{
    
    self = [super initWithFrame:frame];
    
    self.text               = string;
    self.textAlignment      = NSTextAlignmentCenter;
    
    CGRect expectedLabelSize = [string boundingRectWithSize:self.frame.size
                                                    options:NSStringDrawingTruncatesLastVisibleLine
                                                 attributes:@{NSFontAttributeName: [self font]}
                                                    context:nil];
    
    NSLog(@"Label Size W=%f H=%f",expectedLabelSize.size.width,expectedLabelSize.size.height);
    
    self.frame = expectedLabelSize;
    
    return self;
    
}


@end
