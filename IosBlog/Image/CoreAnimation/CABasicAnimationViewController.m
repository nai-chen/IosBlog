//
//  CABasicAnimationViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/5/13.
//

#import "CABasicAnimationViewController.h"
#import "Tool.h"
#import "UIColor+Tool.h"

@interface CABasicAnimationViewController () <CAAnimationDelegate>

@property(nonatomic, strong) CALayer *colorLayer;
@property(nonatomic, strong) UIButton *button;

@end

@implementation CABasicAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.colorLayer = [[CALayer alloc] init];
    self.colorLayer.frame = CGRectMake(30, 100, kDeviceWidth - 60, kDeviceWidth-60);
    self.colorLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:self.colorLayer];
    
    self.button = [[UIButton alloc] init];
    [self.button setTitle:@"开始测试" forState:UIControlStateNormal];
    self.button.backgroundColor = [UIColor magentaColor];
    [self.button addTarget:self action:@selector(onChangeColor:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    UIEdgeInsets insets = self.view.safeAreaInsets;
    self.button.frame = CGRectMake(25, kDeviceHeight-insets.bottom-100, kDeviceWidth-50, 50);
}

- (void)onChangeColor:(UIButton *)sender {
    //步骤1：创建动画
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"backgroundColor";
    //步骤2：设定动画属性
    animation.autoreverses = NO;
    animation.duration = 0.25;
    animation.repeatCount = 1;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.delegate = self;
    UIColor *randomColor = [UIColor randomColor];  //自定义获取随机色的方法
    animation.toValue = (__bridge id _Nullable)(randomColor.CGColor);
    //步骤3：添加动画到图层
    [self.colorLayer addAnimation:animation forKey:@"keyPath_backgroundColor"];
}

- (void)animationDidStop:(CABasicAnimation *)anim finished:(BOOL)flag{
    //禁用隐式动画
    [CATransaction begin];
    [CATransaction setDisableActions:true];
    self.colorLayer.backgroundColor = (__bridge CGColorRef)anim.toValue;
    [CATransaction commit]; 
}

@end
