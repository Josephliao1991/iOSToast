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
    

    [[JLToast makeToast] showWithString:@"My First ViewController"
                          withToastTime:ToastTime_Long
                         withController:self];
    
}


- (IBAction)back:(UIStoryboardSegue*)sender{
    
}

@end
