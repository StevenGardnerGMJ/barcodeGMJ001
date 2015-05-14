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

@property (nonatomic, retain)UIButton *buttonA;
@property (nonatomic, retain)UIWebView *webA;
@property (nonatomic, retain) NSString * srtQRCode1;
@property (nonatomic, retain)UITextField *textF1;


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
    
    
    //  网页前往，
    self.buttonA = [UIButton buttonWithType:UIButtonTypeSystem];
    _buttonA.frame = CGRectMake(20, 300, 120, 30);
    _buttonA.backgroundColor = [UIColor grayColor];
    
    [_buttonA  setTitle:@"前往" forState:UIControlStateNormal];
    [_buttonA  addTarget:self action:@selector(buttonClickA:) forControlEvents:UIControlEventTouchUpInside ];
    
    self.textF1 = [[UITextField alloc]initWithFrame:CGRectMake(0, 200, 320, 30)];
    _textF1.borderStyle = UITextBorderStyleRoundedRect;
    _textF1.placeholder = @"     二维码值:扫描到的东东在此";
    _textF1.font = [UIFont systemFontOfSize:14];
    //textF1.text = @"鲨鱼";
    //_textF1.text = self.srtQRCode1;
    _textF1.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_textF1];

    
    
}
//添加webView用于访问
- (void)buttonClickA:(UIButton *)button
{
    self.webA = [[UIWebView alloc]initWithFrame:self.view.bounds];
    
    [self.view addSubview:_webA];// 添加webView用于访问
    
    [_webA   loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.srtQRCode1]]];
    UIButton * scanButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [scanButton setTitle:@"返回" forState:UIControlStateNormal];
    scanButton.frame = CGRectMake(10, 69, 120, 40);
    [scanButton addTarget:self action:@selector(buttonClickB:) forControlEvents:UIControlEventTouchUpInside];
    [self.webA addSubview:scanButton];
}
-(void)buttonClickB:(UIButton *)button
{
    [self.webA  removeFromSuperview];
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
