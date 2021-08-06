//
//  CAAnimationGroupViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/5/13.
//

#import "CAAnimationGroupViewController.h"
#import "Tool.h"

@interface CAAnimationGroupViewController ()

@property (nonatomic, strong) UIView *colorView;
@property (nonatomic, strong) UIBezierPath *bezierPath;
@property (nonatomic, strong) UIButton *button;

@end

@implementation CAAnimationGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建显示颜色的图层
    self.colorView = [UIView new];
    self.colorView.frame = CGRectMake(0, 0, 60, 60);
    self.colorView.center = CGPointMake(50, 200);
    self.colorView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.colorView];
    
    //创建贝塞尔曲线，即帧动画运动轨迹
    self.bezierPath  = [[UIBezierPath alloc] init];
    [self.bezierPath moveToPoint:CGPointMake(50, 200)];
    [self.bezierPath addCurveToPoint:CGPointMake(kDeviceWidth - 50, 200)
                       controlPoint1:CGPointMake(150, 50)
                       controlPoint2:CGPointMake(kDeviceWidth - 150, 250)];
    
    //绘制绘制path，便于观察动画；
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.path = self.bezierPath.CGPath;
    pathLayer.fillColor = [UIColor clearColor].CGColor;
    pathLayer.strokeColor = [UIColor redColor].CGColor;
    pathLayer.lineWidth = 3.0f;
    [self.view.layer addSublayer:pathLayer];
    
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
    //移除可能未执行完的动画，防止多重动画导致异常
    [self.colorView.layer removeAnimationForKey:@"groupAnimation"];
    
    //1.创建基础动画：修改背景色为紫色
    CABasicAnimation *basicAnimation = [CABasicAnimation animation];
    basicAnimation.keyPath = @"backgroundColor";
    basicAnimation.toValue = (__bridge id _Nullable)([UIColor purpleColor].CGColor);
    
    //2.创建关键帧动画
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animation];
    keyFrameAnimation.keyPath = @"position";
    keyFrameAnimation.path = self.bezierPath.CGPath;
    keyFrameAnimation.rotationMode = kCAAnimationRotateAuto;
    
    //3.创建组动画：组合基础动画和关键帧动画
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = @[basicAnimation, keyFrameAnimation];
    groupAnimation.duration = 4.0;
    [self.colorView.layer addAnimation:groupAnimation forKey:@"groupAnimation"];
}

@end
