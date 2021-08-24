//
//  CAGradientLayerViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/8/24.
//

#import "CAGradientLayerViewController.h"

@interface CAGradientLayerViewController ()

@end

@implementation CAGradientLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self drawGradientLayer];
}

- (void)drawGradientLayer {
    NSArray *colors = @[(id)[UIColor redColor].CGColor, (id)[UIColor blueColor].CGColor];
    
    CAGradientLayer *gradientLayer = [[CAGradientLayer alloc] init];
    gradientLayer.frame = CGRectMake(20, 100, 100, 100);
    gradientLayer.colors = colors;
    [self.view.layer addSublayer:gradientLayer];

    CAGradientLayer *gradientLayer2 = [[CAGradientLayer alloc] init];
    gradientLayer2.frame = CGRectMake(130, 100, 100, 100);
    gradientLayer2.colors = colors;
    gradientLayer2.startPoint = CGPointMake(0, 0);
    gradientLayer2.endPoint = CGPointMake(1, 0);
    [self.view.layer addSublayer:gradientLayer2];

    CAGradientLayer *gradientLayer3 = [[CAGradientLayer alloc] init];
    gradientLayer3.frame = CGRectMake(240, 100, 100, 100);
    gradientLayer3.colors = colors;
    gradientLayer3.locations = @[@(0.25), @(0.75)];
    [self.view.layer addSublayer:gradientLayer3];
    
    CAGradientLayer *gradientLayer4 = [[CAGradientLayer alloc] init];
    gradientLayer4.frame = CGRectMake(20, 250, 100, 100);
    gradientLayer4.colors = colors;
    gradientLayer4.startPoint = CGPointMake(0.5, 0.5);
    gradientLayer4.endPoint = CGPointMake(1, 1);
    gradientLayer4.type = kCAGradientLayerRadial;
    [self.view.layer addSublayer:gradientLayer4];
    
    if (@available(iOS 12.0, *) ) {
        CAGradientLayer *gradientLayer5 = [[CAGradientLayer alloc] init];
        gradientLayer5.frame = CGRectMake(130, 250, 100, 100);
        gradientLayer5.colors = colors;
        gradientLayer5.startPoint = CGPointMake(0.5, 0.5);
        gradientLayer5.endPoint = CGPointMake(1, 0.5);
        gradientLayer5.type = kCAGradientLayerConic;
        [self.view.layer addSublayer:gradientLayer5];
    }
}

@end
