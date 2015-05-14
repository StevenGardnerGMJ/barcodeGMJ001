//
//  CameraViewController.h
//  barcodeGMJ001
//
//  Created by admin on 14/12/18.
//  Copyright (c) 2014年 葛茂菁. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ACEHeader.pch"
#import <AVFoundation/AVFoundation.h>


@interface CameraViewController : UIViewController<AVCaptureMetadataOutputObjectsDelegate>
{
    int num ;
    BOOL upOrdown;
    NSTimer * timer;
}

@property(nonatomic, strong)AVCaptureDevice * device;
@property(nonatomic, strong)AVCaptureDeviceInput * input;
@property(nonatomic, strong)AVCaptureMetadataOutput * output;
@property(nonatomic, strong)AVCaptureSession *session;
@property(nonatomic, strong)AVCaptureVideoPreviewLayer * preview;
//@property(nonatomic, strong)UIImageView * lineView;
@property(nonatomic, strong)void(^blockResult)(NSString *strResult);
@end
