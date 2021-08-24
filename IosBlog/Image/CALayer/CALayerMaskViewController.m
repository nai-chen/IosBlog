//
//  CALayerMaskViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/8/24.
//

#import "CALayerMaskViewController.h"

@interface CALayerMaskViewController ()

@end

@implementation CALayerMaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self drawGradientLayer];
    [self drawCircleLayer];
    [self drawMaskLayer];
}

- (void)drawGradientLayer {
    NSArray *colors = @[(id)[UIColor redColor].CGColor, (id)[UIColor blueColor].CGColor];
    
    CAGradientLayer *gradientLayer = [[CAGradientLayer alloc] init];
    gradientLayer.frame = CGRectMake(20, 100, 100, 100);
    gradientLayer.colors = colors;
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 1);
    [self.view.layer addSublayer:gradientLayer];
}

- (void)drawCircleLayer {
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(140, 110, 80, 80)];
      
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.path = bezierPath.CGPath;

    layer.strokeColor = [UIColor redColor].CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.lineWidth = 10;
    layer.strokeStart = 0;
    layer.strokeEnd = 1;
    layer.lineDashPattern = @[@6, @2];
    [self.view.layer addSublayer:layer];
}

- (void)drawMaskLayer {
    NSArray *colors = @[(id)[UIColor redColor].CGColor, (id)[UIColor blueColor].CGColor];

    CAGradientLayer *gradientLayer = [[CAGradientLayer alloc] init];
    gradientLayer.frame = CGRectMake(240, 100, 100, 100);
    gradientLayer.colors = colors;
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 1);
    [self.view.layer addSublayer:gradientLayer];

    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 80, 80)];

    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.path = bezierPath.CGPath;

    layer.strokeColor = [UIColor redColor].CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.lineWidth = 10;
    layer.strokeStart = 0;
    layer.strokeEnd = 1;
    layer.lineDashPattern = @[@6, @2];
    gradientLayer.mask = layer;
    
}

@end
