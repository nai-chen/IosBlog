//
//  CAShapeLayerViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/8/23.
//

#import "CAShapeLayerViewController.h"

@interface CAShapeLayerViewController ()

@property(nonatomic, strong) CAShapeLayer *layer; // 绘制
@property(nonatomic, strong) NSTimer *timer; // 定时器

@end

@implementation CAShapeLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    [self drawRoundedRect];
    [self drawCircleLayer];
}

- (void)drawRoundedRect {
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(50, 100, 120, 80)
            byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:CGSizeMake(20, 10)];
    
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.path = bezierPath.CGPath;
    
    layer.strokeColor = [UIColor redColor].CGColor;
    layer.fillColor = [UIColor greenColor].CGColor;
    layer.lineWidth = 3;
    layer.strokeStart = 0;
    layer.strokeEnd = 0.5;
    layer.lineDashPattern = @[@6, @2];
    
    [self.view.layer addSublayer:layer];
}

- (void)drawCircleLayer {
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 250, 100, 100)];
      
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.path = bezierPath.CGPath;

    layer.strokeColor = [UIColor redColor].CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.lineWidth = 15;
    layer.strokeStart = 0;
    layer.strokeEnd = 0;
    layer.lineDashPattern = @[@6, @2];
    
    [self.view.layer addSublayer:layer];

    self.layer = layer;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(strokeAction) userInfo:nil repeats:YES];
}

- (void)strokeAction {
    if (self.layer.strokeEnd >= 1) {
        // 销毁定时器
        [self.timer invalidate];
        self.timer = nil;
        return;
    } else {
        // 每次+0.05
        self.layer.strokeEnd += 0.05;
    }
}

@end
