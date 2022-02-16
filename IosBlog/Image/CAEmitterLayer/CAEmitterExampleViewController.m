//
//  CAEmitterExampleViewController.m
//  IosBlog
//
//  Created by PeterChen on 2022/2/15.
//

#import "CAEmitterExampleViewController.h"
#import "CAEmitterAnimationViewController.h"

@interface CAEmitterExampleViewController ()

@property(nonatomic, strong) UIImageView *imageView;

@end

@implementation CAEmitterExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *snowButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 100, 100, 30)];
    [snowButton setTitle:@"snow" forState:UIControlStateNormal];
    [snowButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:snowButton];
    
    [snowButton addTarget:self action:@selector(onSnowClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *explodeButton = [[UIButton alloc] initWithFrame:CGRectMake(150, 100, 100, 30)];
    [explodeButton setTitle:@"explode" forState:UIControlStateNormal];
    [explodeButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:explodeButton];
    
    [explodeButton addTarget:self action:@selector(onExplodeClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.center.x-20, 300, 40, 40)];
    self.imageView.image = [UIImage imageNamed:@"launch"];
    [self.view addSubview: self.imageView];
}

- (void)onSnowClick:(UIButton *)sender {
    CAEmitterLayer *emitterLayer = [CAEmitterLayer layer];
    emitterLayer.contents = (id)[UIImage imageNamed:@"icon_iv_sample"].CGImage;
    emitterLayer.frame = self.view.bounds;
    emitterLayer.emitterPosition = CGPointMake(self.view.center.x, -10);
    emitterLayer.emitterSize = CGSizeMake(self.view.bounds.size.width-100, 10);
    
    emitterLayer.emitterShape = kCAEmitterLayerLine;
    emitterLayer.emitterMode = kCAEmitterLayerLine;
    emitterLayer.renderMode = kCAEmitterLayerAdditive;
    
    CAEmitterCell *cell = [CAEmitterCell emitterCell];
    cell.contents = (id)[UIImage imageNamed:@"snow_white"].CGImage;
    cell.birthRate = 50;
    cell.lifetime = 20;
    cell.lifetimeRange = 2;
    cell.scale = 0.3;
    cell.scaleRange = 0.2;
    cell.yAcceleration = 50;
    cell.alphaSpeed = -0.05;
    cell.velocity = 75;
    cell.emissionRange = 0.5 * M_PI_4;
    
    emitterLayer.emitterCells = @[cell];
    
    CAEmitterAnimationViewController *vc = [[CAEmitterAnimationViewController alloc] init];
    vc.emitterLayer = emitterLayer;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)onExplodeClick:(UIButton *)sender {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.repeatCount = 1;
    animation.duration = 0.2;
    animation.toValue = @1.2;

    [self.imageView.layer addAnimation:animation forKey:nil];
    
    CAEmitterLayer *emitterLayer = [CAEmitterLayer layer];
    emitterLayer.beginTime = CACurrentMediaTime();
    emitterLayer.frame = self.view.bounds;
    emitterLayer.emitterPosition = self.imageView.center;
    emitterLayer.emitterSize = CGSizeMake(50, 50);

    emitterLayer.emitterShape = kCAEmitterLayerCircle;
    emitterLayer.emitterMode = kCAEmitterLayerOutline;

    CAEmitterCell *cell = [CAEmitterCell emitterCell];
    cell.contents = (id)[UIImage imageNamed:@"launch"].CGImage;
    cell.birthRate = 2000;
    cell.lifetime = 0.3;
    cell.lifetimeRange = 0.05;
    cell.scale = 0.03;
    cell.scaleRange = 0.01;
    cell.velocity = 80;
    cell.velocityRange = 20;

    emitterLayer.emitterCells = @[cell];
    
    [self.view.layer addSublayer:emitterLayer];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        emitterLayer.birthRate = 0;
    });
}

@end
