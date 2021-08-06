//
//  CAKeyframeAnimationPathViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/5/13.
//

#import "CAKeyframeAnimationPathViewController.h"
#import "Tool.h"

@interface CAKeyframeAnimationPathViewController ()

@property (nonatomic, strong) UIBezierPath *bezierPath;
@property (nonatomic, strong) UIImageView *airPlaneImgView;
@property (nonatomic, strong) UIButton *button;

@end

@implementation CAKeyframeAnimationPathViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.创建三次贝塞尔曲线(一种使用起始点，结束点和另外两个控制点定义的曲线);
    self.bezierPath  = [[UIBezierPath alloc] init];
    [self.bezierPath moveToPoint:CGPointMake(50, 200)];
    [self.bezierPath addCurveToPoint:CGPointMake(kDeviceWidth - 50, 200)
                controlPoint1:CGPointMake(150, 50)
                controlPoint2:CGPointMake(kDeviceWidth - 150, 250)];
    
    //2.绘制飞行路线
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.path = self.bezierPath.CGPath;
    pathLayer.fillColor = [UIColor clearColor].CGColor;
    pathLayer.strokeColor = [UIColor redColor].CGColor;
    pathLayer.lineWidth = 3.0f;
    [self.view.layer addSublayer:pathLayer];
    
    //3.创建显示飞机的视图
    self.airPlaneImgView = [[UIImageView alloc] init];
    self.airPlaneImgView.frame = CGRectMake(0, 0, 50, 50);
    self.airPlaneImgView.center = CGPointMake(50, 200);
    self.airPlaneImgView.image = [UIImage imageNamed:@"airplane"];
    [self.view addSubview:self.airPlaneImgView];
    
    self.button = [[UIButton alloc] init];
    [self.button setTitle:@"开始测试" forState:UIControlStateNormal];
    self.button.backgroundColor = [UIColor magentaColor];
    [self.button addTarget:self action:@selector(onChangePath:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    UIEdgeInsets insets = self.view.safeAreaInsets;
    self.button.frame = CGRectMake(25, kDeviceHeight-insets.bottom-100, kDeviceWidth-50, 50);
}

-(void) onChangePath: (UIButton*) sender {
    //4.设置关键帧动画
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 5.0;
    animation.path = self.bezierPath.CGPath;
    animation.rotationMode = kCAAnimationRotateAuto; //设置根据曲线的切线自动旋转,让动画更加真实
    [self.airPlaneImgView.layer addAnimation:animation forKey:nil];
}

@end
