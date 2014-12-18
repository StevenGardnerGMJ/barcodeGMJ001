//
//  ViewController.m
//  barcodeGMJ001
//
//  Created by admin on 14/12/18.
//  Copyright (c) 2014年 葛茂菁. All rights reserved.
//

#import "ViewController.h"
#import "ACEHeader.pch"
#import "CameraViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"viewcontroller";
    UIButton * scanButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [scanButton setTitle:@"扫描" forState:UIControlStateNormal];
    scanButton.frame = CGRectMake([[UIScreen mainScreen] applicationFrame].size.width / 9, [[UIScreen mainScreen]applicationFrame].size.height / 8, kX() + 20, kY());
    [scanButton addTarget:self action:@selector(scanCameraClick) forControlEvents:(UIControlEventTouchUpInside)];
    [scanButton setBackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:scanButton];
}

-(void)scanCameraClick
{
    CameraViewController * cameraVC = [[CameraViewController alloc]init];
    [self presentViewController:cameraVC animated:YES completion:^{
       // NSLog(@"%@", self.title);
    }];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
