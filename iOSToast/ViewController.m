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
    

    [[JLToast makeToastWithString:@"My FirstViewController" withToastTime:ToastTime_Long] show];
    
}

- (IBAction)showToast2:(UIButton *)sender {
    
    [[JLToast makeToastWithString:@"Show Tosat 2" withToastTime:ToastTime_Long] show];
}

- (IBAction)showToast3:(UIButton *)sender {
    
    [[JLToast makeToastWithString:@"野野野野野  還是八仙好玩！！" withToastTime:ToastTime_Long] show];
    
}


- (IBAction)back:(UIStoryboardSegue*)sender{
    
}

@end
