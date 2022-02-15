//
//  CAEmitterCellViewController.m
//  IosBlog
//
//  Created by PeterChen on 2022/2/14.
//

#import "CAEmitterCellViewController.h"
#import "CAEmitterAnimationViewController.h"

@interface CAEmitterCellViewController ()

@property(nonatomic, strong) UITextField *lifetimeTextField;
@property(nonatomic, strong) UITextField *lifetimeRangeTextField;

@property(nonatomic, strong) UITextField *velocityTextField;
@property(nonatomic, strong) UITextField *velocityRangeTextField;

@property(nonatomic, strong) UITextField *scaleTextField;
@property(nonatomic, strong) UITextField *scaleRangeTextField;
@property(nonatomic, strong) UITextField *scaleSpeedTextField;

@property(nonatomic, strong) UITextField *xAccelerationTextField;
@property(nonatomic, strong) UITextField *yAccelerationTextField;

@property(nonatomic, strong) UITextField *spinTextField;
@property(nonatomic, strong) UITextField *spinRangeTextField;

@property(nonatomic, strong) UITextField *alphaRangeTextField;
@property(nonatomic, strong) UITextField *alphaSpeedTextField;

@property(nonatomic, strong) UITextField *emissionRangeTextField;

@property(nonatomic, strong) CAEmitterLayer *emitterLayer;

@end

@implementation CAEmitterCellViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UILabel *lifetimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 80, 30)];
    lifetimeLabel.text = @"lifetime:";
    lifetimeLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:lifetimeLabel];
    
    self.lifetimeTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 50, 30)];
    self.lifetimeTextField.text = @"8";
    self.lifetimeTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.lifetimeTextField];

    UILabel *lifetimeRangeLabel = [[UILabel alloc] initWithFrame:CGRectMake(160, 100, 80, 30)];
    lifetimeRangeLabel.text = @"range:";
    lifetimeRangeLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:lifetimeRangeLabel];
    
    self.lifetimeRangeTextField = [[UITextField alloc] initWithFrame:CGRectMake(250, 100, 50, 30)];
    self.lifetimeRangeTextField.text = @"2";
    self.lifetimeRangeTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.lifetimeRangeTextField];
    
    UILabel *velocityLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 140, 80, 30)];
    velocityLabel.text = @"velocity:";
    velocityLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:velocityLabel];
    
    self.velocityTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 140, 50, 30)];
    self.velocityTextField.text = @"0";
    self.velocityTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.velocityTextField];

    UILabel *velocityRangeLabel = [[UILabel alloc] initWithFrame:CGRectMake(160, 140, 80, 30)];
    velocityRangeLabel.text = @"range:";
    velocityRangeLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:velocityRangeLabel];
    
    self.velocityRangeTextField = [[UITextField alloc] initWithFrame:CGRectMake(250, 140, 50, 30)];
    self.velocityRangeTextField.text = @"0";
    self.velocityRangeTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.velocityRangeTextField];
    
    UILabel *scaleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 180, 80, 30)];
    scaleLabel.text = @"scale:";
    scaleLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:scaleLabel];
    
    self.scaleTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 180, 50, 30)];
    self.scaleTextField.text = @"0.2";
    self.scaleTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.scaleTextField];

    UILabel *scaleRangeLabel = [[UILabel alloc] initWithFrame:CGRectMake(160, 180, 80, 30)];
    scaleRangeLabel.text = @"range:";
    scaleRangeLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:scaleRangeLabel];
    
    self.scaleRangeTextField = [[UITextField alloc] initWithFrame:CGRectMake(250, 180, 50, 30)];
    self.scaleRangeTextField.text = @"0.05";
    self.scaleRangeTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.scaleRangeTextField];
    
    UILabel *scaleSpeedLabel = [[UILabel alloc] initWithFrame:CGRectMake(160, 220, 80, 30)];
    scaleSpeedLabel.text = @"speed:";
    scaleSpeedLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:scaleSpeedLabel];
    
    self.scaleSpeedTextField = [[UITextField alloc] initWithFrame:CGRectMake(250, 220, 50, 30)];
    self.scaleSpeedTextField.text = @"0";
    self.scaleSpeedTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.scaleSpeedTextField];
    
    UILabel *xAccelerationLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 260, 80, 30)];
    xAccelerationLabel.text = @"xAcceleration:";
    xAccelerationLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:xAccelerationLabel];
    
    self.xAccelerationTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 260, 50, 30)];
    self.xAccelerationTextField.text = @"0";
    self.xAccelerationTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.xAccelerationTextField];

    UILabel *yAccelerationLabel = [[UILabel alloc] initWithFrame:CGRectMake(160, 260, 80, 30)];
    yAccelerationLabel.text = @"yAcceleration:";
    yAccelerationLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:yAccelerationLabel];
    
    self.yAccelerationTextField = [[UITextField alloc] initWithFrame:CGRectMake(250, 260, 50, 30)];
    self.yAccelerationTextField.text = @"20";
    self.yAccelerationTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.yAccelerationTextField];
    
    
    UILabel *spinLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 300, 80, 30)];
    spinLabel.text = @"spin:";
    spinLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:spinLabel];
    
    self.spinTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 300, 50, 30)];
    self.spinTextField.text = @"0";
    self.spinTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.spinTextField];

    UILabel *spinRangeLabel = [[UILabel alloc] initWithFrame:CGRectMake(160, 300, 80, 30)];
    spinRangeLabel.text = @"range:";
    spinRangeLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:spinRangeLabel];
    
    self.spinRangeTextField = [[UITextField alloc] initWithFrame:CGRectMake(250, 300, 50, 30)];
    self.spinRangeTextField.text = @"1";
    self.spinRangeTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.spinRangeTextField];
    
    UILabel *alphaRangeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 340, 80, 30)];
    alphaRangeLabel.text = @"alphaRange:";
    alphaRangeLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:alphaRangeLabel];
    
    self.alphaRangeTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 340, 50, 30)];
    self.alphaRangeTextField.text = @"0";
    self.alphaRangeTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.alphaRangeTextField];

    UILabel *alphaSpeedLabel = [[UILabel alloc] initWithFrame:CGRectMake(160, 340, 80, 30)];
    alphaSpeedLabel.text = @"alphaSpeed:";
    alphaSpeedLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:alphaSpeedLabel];
    
    self.alphaSpeedTextField = [[UITextField alloc] initWithFrame:CGRectMake(250, 340, 50, 30)];
    self.alphaSpeedTextField.text = @"0";
    self.alphaSpeedTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.alphaSpeedTextField];
    
    
    UILabel *emissionRangeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 380, 80, 30)];
    emissionRangeLabel.text = @"emissionRange:";
    emissionRangeLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:emissionRangeLabel];
    
    self.emissionRangeTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 380, 50, 30)];
    self.emissionRangeTextField.text = @"0";
    self.emissionRangeTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.emissionRangeTextField];
    
    
    UIButton *startButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 450, 100, 30)];
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
    
    CAEmitterCell *cell = [CAEmitterCell emitterCell];
    cell.contents = (id)[UIImage imageNamed:@"launch"].CGImage;
    cell.birthRate = 5;
    cell.lifetime = [self.lifetimeTextField.text floatValue];
    cell.lifetimeRange = [self.lifetimeRangeTextField.text floatValue];
    cell.scale = [self.scaleTextField.text floatValue];
    cell.scaleRange = [self.scaleRangeTextField.text floatValue];
    cell.scaleSpeed = [self.scaleSpeedTextField.text floatValue];
    cell.velocity = [self.velocityTextField.text floatValue];
    cell.velocityRange = [self.velocityRangeTextField.text floatValue];
    cell.xAcceleration = [self.xAccelerationTextField.text floatValue];
    cell.yAcceleration = [self.yAccelerationTextField.text floatValue];

    cell.spin = [self.spinTextField.text floatValue] * M_PI;
    cell.spinRange = [self.spinRangeTextField.text floatValue] * M_PI;
    
    cell.alphaRange = [self.alphaRangeTextField.text floatValue];
    cell.alphaSpeed = [self.alphaSpeedTextField.text floatValue];
    
    cell.emissionRange = [self.emissionRangeTextField.text floatValue] * M_PI;
    
    self.emitterLayer.emitterCells = @[cell];
    
    CAEmitterAnimationViewController *vc = [[CAEmitterAnimationViewController alloc] init];
    vc.emitterLayer = self.emitterLayer;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
