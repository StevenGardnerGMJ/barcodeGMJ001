//
//  CameraViewController.m
//  barcodeGMJ001
//
//  Created by admin on 14/12/18.
//  Copyright (c) 2014年 葛茂菁. All rights reserved.
//

#import "CameraViewController.h"

@interface CameraViewController ()

@end

@implementation CameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title  = @"CameraViewController";
    //  古董白250,235,215 
    self.view.backgroundColor = RGBACOLORA(105, 105, 105, 1);
    
    
    UIButton * scanButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [scanButton setTitle:@"取消" forState:UIControlStateNormal];
    scanButton.frame = CGRectMake([[UIScreen mainScreen]applicationFrame].size.width / 2 - 60, kY()*8 - 160, 120, 40);
    [scanButton addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
    scanButton.titleLabel.font = [UIFont systemFontOfSize:26.0];
    [scanButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:scanButton];
    
    UILabel * labIntroudction= [[UILabel alloc] initWithFrame:CGRectMake(15, 40, 290, 50)];
    labIntroudction.backgroundColor = [UIColor clearColor];
    labIntroudction.numberOfLines=2;
    labIntroudction.textColor=[UIColor whiteColor];
    labIntroudction.text=@"将二维码图像置于矩形方框内，离手机摄像头10CM左右，系统会自动识别。";
    [self.view addSubview:labIntroudction];
    
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(kX() - 40, 100, 300, 300)];
    imageView.image = [UIImage imageNamed:@"square"];
    imageView.center = CGPointMake(kX()* 4 , kY() * 4 - 60);
    [self.view addSubview:imageView];
    
    
    _lineView = [[UIImageView alloc] initWithFrame:CGRectMake(kX(), 110, 220, 2)];
    _lineView.center = CGPointMake(kX() * 4, kY() * 4 - 60-150);
    _lineView.image = [UIImage imageNamed:@"line.png"];
    [self.view addSubview:_lineView];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:.02 target:self selector:@selector(animation1) userInfo:nil repeats:YES];//动画周期
    upOrdown = NO;//初始
    num = 0; //初始
    
    
}
//  扫
-(void)animation1
{
    if (upOrdown == NO ) {
        //_lineView.frame = CGRectMake(kX(), 110+(num++)*2, 220, 2);
         _lineView.center = CGPointMake(kX() * 4,kY() * 4 - 60-150+(num++)*2);
        if (2*num == 290) {
            upOrdown = YES;
        }
    } else {
        
        _lineView.center = CGPointMake(kX() * 4, kY() * 4 - 60-150+(num--)*2);
       // _lineView.frame = CGRectMake(kX(), 110+(num--)*2,220,2);
        if (2*num == 0) {
            upOrdown = NO;
        }
    }
}
// 取消
-(void)cancelAction
{
    [self dismissViewControllerAnimated:YES completion:^{
        self.view.backgroundColor = [UIColor greenColor];
    }];
}
- (void)viewWillAppear:(BOOL)animated
{  //进入相机
    
    
}
-(void)stepIntoCamera
{
    _device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    _input  = [AVCaptureDeviceInput deviceInputWithDevice:self.device error:nil];
    _output = [[AVCaptureMetadataOutput alloc] init];
    [ _output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    _session = [[AVCaptureSession alloc]init];
    [_session setSessionPreset:AVCaptureSessionPresetHigh];
    if ([_session canAddInput:self.input]) {
        [_session addInput:self.input];
    }
    if ([_session canAddOutput:self.output]) {
        [_session addOutput:self.output];
    }
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
