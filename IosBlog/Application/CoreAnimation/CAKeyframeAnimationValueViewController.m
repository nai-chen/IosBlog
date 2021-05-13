//
//  CAKeyframeAnimationValueViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/5/13.
//

#import "CAKeyframeAnimationValueViewController.h"
#import "Tool.h"

@interface CAKeyframeAnimationValueViewController ()

@property (nonatomic, strong) UIView *purpleView;
@property (nonatomic, strong) UIButton* button;

@end

@implementation CAKeyframeAnimationValueViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //创建测试帧动画的紫色图层
    self.purpleView = [UIView new];
    self.purpleView.frame = CGRectMake(0, 0, 50, 50);
    self.purpleView.center = CGPointMake(50, 100);
    self.purpleView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.purpleView];
    
    self.button = [[UIButton alloc] init];
    [self.button setTitle:@"开始测试" forState:UIControlStateNormal];
    self.button.backgroundColor = [UIColor magentaColor];
    [self.button addTarget:self action:@selector(onChangeValue:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    UIEdgeInsets insets = self.view.safeAreaInsets;
    self.button.frame = CGRectMake(25, kDeviceHeight-insets.bottom-100, kDeviceWidth-50, 50);
}

-(void) onChangeValue:(UIButton*) sender {
    //步骤1：创建动画
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    //步骤2：设置动画关键帧数据
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(50, 100)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(kDeviceWidth -50, 100)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(kDeviceWidth -50, kDeviceWidth- 100)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(50, kDeviceWidth -100)];
    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(50, 100)];
    animation.values = @[value1,value2,value3,value4,value5];
    //步骤3：设定动画属性
    animation.repeatCount = MAXFLOAT; //重复执行
    animation.autoreverses = NO;
    animation.removedOnCompletion = NO;
    animation.duration = 4;
    //animation.keyTimes = @[@(0), @(1 / 10.0), @(5 / 10.0), @(9 / 10.0), @(1) ];
    animation.timingFunctions  = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                   [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                   [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                   [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];

    [self.purpleView.layer addAnimation:animation forKey:nil];
}

@end
