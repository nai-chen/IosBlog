//
//  AVCaptureDeviceViewController.m
//  IosBlog
//
//  Created by PC010055 on 2023/4/19.
//

#import "AVCaptureDeviceViewController.h"

#import <AVFoundation/AVFoundation.h>

@interface AVCaptureDeviceViewController () <AVCapturePhotoCaptureDelegate>

// 捕获设备，通常是前置摄像头，后置摄像头，麦克风（音频输入）
@property(nonatomic, strong) AVCaptureDevice *device;
// AVCaptureDeviceInput 代表输入设备，他使用AVCaptureDevice 来初始化
@property(nonatomic, strong) AVCaptureDeviceInput *input;
// 输出图片
@property(nonatomic ,strong) AVCapturePhotoOutput *imageOutput;
// session：由他把输入输出结合在一起，并开始启动捕获设备（摄像头）
@property(nonatomic, strong) AVCaptureSession *session;
// 图像预览层，实时显示捕获的图像
@property(nonatomic, strong) AVCaptureVideoPreviewLayer *previewLayer;

@property(nonatomic, strong) UIImageView *takePhoneImageView;

@end

@implementation AVCaptureDeviceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupCamera];
    [self setupInitialUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //设备取景开始
    [self.session startRunning];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.session stopRunning];
}

- (void)setupCamera {
    self.device = [self cameraWithPosition:AVCaptureDevicePositionBack];
    self.input = [[AVCaptureDeviceInput alloc] initWithDevice:self.device error:nil];

    self.imageOutput = [[AVCapturePhotoOutput alloc] init];

    self.session = [[AVCaptureSession alloc] init];
    self.session.sessionPreset = AVCaptureSessionPresetHigh;

    //输入输出设备结合
    if ([self.session canAddInput:self.input]) {
        [self.session addInput:self.input];
    }
    if ([self.session canAddOutput:self.imageOutput]) {
        [self.session addOutput:self.imageOutput];
    }

    //预览层的生成
    self.previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:self.session];
    self.previewLayer.frame = [UIScreen mainScreen].bounds;
    self.previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    [self.view.layer addSublayer:self.previewLayer];
}

- (AVCaptureDevice *)cameraWithPosition:(AVCaptureDevicePosition)position {
    AVCaptureDeviceDiscoverySession *session = [AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes:@[AVCaptureDeviceTypeBuiltInWideAngleCamera] mediaType:AVMediaTypeVideo position:position];
    NSArray *devices = [session devices];
    for (AVCaptureDevice *device in devices) {
        if (device.position == position) {
            return device;
        }
    }
    return nil;
}

- (void)setupInitialUI {
    [self.view addSubview:self.takePhoneImageView];
    [self.takePhoneImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@67.5);
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-50-kBottomSafeHeight);
    }];
    
}

- (UIImageView *)takePhoneImageView {
    if (!_takePhoneImageView) {
        _takePhoneImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ps_btn"]];
        
        _takePhoneImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTakePhoneAction:)];
        [_takePhoneImageView addGestureRecognizer:recognizer];
    }
    return _takePhoneImageView;
}

- (void)onTakePhoneAction:(UIGestureRecognizer *)recognizer {
    self.takePhoneImageView.userInteractionEnabled = NO;
    
    AVCaptureConnection *conntion = [self.imageOutput connectionWithMediaType:AVMediaTypeVideo];
    if (!conntion) {
        NSLog(@"拍照失败!");
        
        self.takePhoneImageView.userInteractionEnabled = YES;
        return;
    }
    
    AVCapturePhotoSettings *set = [AVCapturePhotoSettings photoSettings];
    [self.imageOutput capturePhotoWithSettings:set delegate:self];
}

#pragma mark - AVCapturePhotoCaptureDelegate -
- (void)captureOutput:(AVCapturePhotoOutput *)output didFinishProcessingPhoto:(AVCapturePhoto *)photo error:(NSError *)error {
    if (!error) {
        // 使用该方式获取图片，可能图片会存在旋转问题，在使用的时候调整图片即可
        NSData *data = [photo fileDataRepresentation];
//        self.image = [UIImage imageWithData:data];
    }
    self.takePhoneImageView.userInteractionEnabled = YES;
}

@end
