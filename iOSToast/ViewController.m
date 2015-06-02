//
//  ViewController.m
//  iOSToast
//
//  Created by TSUNG-LUN LIAO on 2015/5/12.
//  Copyright (c) 2015年 TSUNG-LUN LIAO. All rights reserved.
//

#import "ViewController.h"
#import "JLToast.h"
#import "JLDynamicLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showToast:(UIButton *)sender {
    

    [[JLToast makeToastWithString:@"My FirstViewController \n Happy Piano"
                    withToastTime:ToastTime_Long
                    withToastSize:ToastSize_Tiny] show];
    
}

- (IBAction)showToast2:(UIButton *)sender {
    
    [[JLToast makeToastWithString:@"躺著玩 坐著玩 趴著玩 \n 還是八仙好玩"
                    withToastTime:ToastTime_Long
                    withToastSize:ToastSize_Little] show];
}

- (IBAction)showToast3:(UIButton *)sender {
    
    [[JLToast makeToastWithString:@"野野野野野  還是八仙好玩！！"
                    withToastTime:ToastTime_Long
                    withToastSize:ToastSize_Large] show];
    
}


- (IBAction)back:(UIStoryboardSegue*)sender{
    
}

@end
