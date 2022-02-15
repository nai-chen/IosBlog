//
//  CAEmitterLayerPropertyViewController.m
//  IosBlog
//
//  Created by PeterChen on 2022/2/14.
//

#import "CAEmitterLayerPropertyViewController.h"
#import "CAEmitterAnimationViewController.h"

@interface CAEmitterLayerPropertyViewController ()

@property(nonatomic, strong) UITextField *birthRateTextField;
@property(nonatomic, strong) UITextField *lifetimeTextField;
@property(nonatomic, strong) UITextField *scaleTextField;
@property(nonatomic, strong) UITextField *velocityTextField;
@property(nonatomic, strong) UITextField *spinTextField;

@property(nonatomic, strong) CAEmitterLayer *emitterLayer;

@end

@implementation CAEmitterLayerPropertyViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UILabel *birthRateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 80, 30)];
    birthRateLabel.text = @"birthRate:";
    birthRateLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:birthRateLabel];
    
    self.birthRateTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 50, 30)];
    self.birthRateTextField.text = @"3";
    self.birthRateTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.birthRateTextField];

    UILabel *lifetimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(160, 100, 80, 30)];
    lifetimeLabel.text = @"lifetime:";
    lifetimeLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:lifetimeLabel];
    
    self.lifetimeTextField = [[UITextField alloc] initWithFrame:CGRectMake(250, 100, 50, 30)];
    self.lifetimeTextField.text = @"10";
    self.lifetimeTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.lifetimeTextField];
    
    UILabel *scaleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 140, 80, 30)];
    scaleLabel.text = @"scale:";
    scaleLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:scaleLabel];
    
    self.scaleTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 140, 50, 30)];
    self.scaleTextField.text = @"0.2";
    self.scaleTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.scaleTextField];
    
    UILabel *velocityLabel = [[UILabel alloc] initWithFrame:CGRectMake(160, 140, 80, 30)];
    velocityLabel.text = @"velocity:";
    velocityLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:velocityLabel];
    
    self.velocityTextField = [[UITextField alloc] initWithFrame:CGRectMake(250, 140, 50, 30)];
    self.velocityTextField.text = @"20";
    self.velocityTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.velocityTextField];
    
    UILabel *spinLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 180, 80, 30)];
    spinLabel.text = @"spin:";
    spinLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:spinLabel];
    
    self.spinTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 180, 50, 30)];
    self.spinTextField.text = @"1";
    self.spinTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.spinTextField];
    
    UIButton *startButton = [[UIButton alloc] initWithFrame:CGRectMake(160, 180, 100, 30)];
    [startButton setTitle:@"start" forState:UIControlStateNormal];
    [startButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:startButton];
    
    [startButton addTarget:self action:@selector(onStartClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.emitterLayer = [CAEmitterLayer layer];
    self.emitterLayer.frame = self.view.bounds;

    self.emitterLayer.emitterPosition = CGPointMake(self.view.center.x, 150);
    self.emitterLayer.emitterSize = CGSizeMake(200, 50);
    
    // 发射源的形状
    self.emitterLayer.emitterShape = kCAEmitterLayerLine;
    self.emitterLayer.emitterMode = kCAEmitterLayerSurface;
}

- (void)onStartClick:(UIButton *)sender {
    NSLog(@"onStartClick");
    
    [self.emitterLayer removeFromSuperlayer];
    
    NSLog(@"%@ %@ %@ %@ %@", self.birthRateTextField.text, self.lifetimeTextField.text,
          self.scaleTextField.text, self.velocityTextField.text, self.spinTextField.text);
    
    // 每秒钟产生的粒子数量, 默认1
    self.emitterLayer.birthRate = [self.birthRateTextField.text floatValue];
    // 粒子的生命周期, 默认1
    self.emitterLayer.lifetime = [self.lifetimeTextField.text floatValue];
    // 粒子的缩放比例系数, 默认是1
    self.emitterLayer.scale = [self.scaleTextField.text floatValue];
    // 粒子发射速度, 默认1.0, 为负的时候发散方向是向反方向的 为正时是向指定方向的
    self.emitterLayer.velocity = [self.velocityTextField.text floatValue];
    // 自旋转速度系数, 默认1.0
    self.emitterLayer.spin = [self.spinTextField.text floatValue];
    
    CAEmitterCell *cell = [CAEmitterCell emitterCell];
    cell.contents = (id)[UIImage imageNamed:@"launch"].CGImage;
    cell.birthRate = 1;
    cell.lifetime = 1;
    cell.scale = 1;
    cell.velocity = 1;
    cell.yAcceleration = 20;
    cell.spin = 1;
    
    self.emitterLayer.emitterCells = @[cell];
    
    CAEmitterAnimationViewController *vc = [[CAEmitterAnimationViewController alloc] init];
    vc.emitterLayer = self.emitterLayer;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
