//
//  LayerAnimationTransactionViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/5/13.
//

#import "LayerAnimationTransactionViewController.h"
#import "Tool.h"

@interface LayerAnimationTransactionViewController ()

@property (nonatomic, strong) CALayer *colorLayer;
@property (nonatomic, strong) UIButton* button;

@end

@implementation LayerAnimationTransactionViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.colorLayer = [[CALayer alloc] init];
    self.colorLayer.frame = CGRectMake(30, 100, kDeviceWidth - 60, kDeviceWidth-60);
    self.colorLayer.backgroundColor = [UIColor orangeColor].CGColor;
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

-(void) onChangeColor: (UIButton*) sender {
    [CATransaction begin];  //入栈
    //1.设置动画执行时间
    [CATransaction setAnimationDuration:3];
    //2.设置动画执行完毕后的操作：颜色渐变之后再旋转90度
    [CATransaction setCompletionBlock:^{
        CGAffineTransform transform = self.colorLayer.affineTransform;
        transform  = CGAffineTransformRotate(transform, M_PI_2);
        self.colorLayer.affineTransform = transform;
    }];
    
    CGFloat red = arc4random() % 255 / 255.0;
    CGFloat green = arc4random() % 255 / 255.0;
    CGFloat blue = arc4random() % 255 / 255.0;
    UIColor *randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    _colorLayer.backgroundColor = randomColor.CGColor;
    [CATransaction commit];  //出栈
}

@end
