//
//  LayerAnimationNormalViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/5/13.
//

#import "LayerAnimationNormalViewController.h"
#import "Tool.h"

@interface LayerAnimationNormalViewController ()

@property(nonatomic, strong) CALayer *colorLayer;
@property(nonatomic, strong) UIButton *button;

@end

@implementation LayerAnimationNormalViewController

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

- (void)onChangeColor:(UIButton *)sender {
    CGFloat red = arc4random() % 255 / 255.0;
    CGFloat green = arc4random() % 255 / 255.0;
    CGFloat blue = arc4random() % 255 / 255.0;
    UIColor *randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];
        
    self.colorLayer.backgroundColor = randomColor.CGColor;
}

@end
