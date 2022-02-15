//
//  CAEmitterLayerNormalViewController.m
//  IosBlog
//
//  Created by PeterChen on 2022/2/14.
//

#import "CAEmitterLayerNormalViewController.h"
#import "CAEmitterAnimationViewController.h"

@interface CAEmitterLayerNormalViewController ()

@property(nonatomic, strong) UISegmentedControl *shapeSegmentedControl;
@property(nonatomic, strong) NSArray *shapeArray;

@property(nonatomic, strong) UISegmentedControl *modeSegmentedControl;
@property(nonatomic, strong) NSArray *modeArray;

@property(nonatomic, strong) UISegmentedControl *renderSegmentedControl;
@property(nonatomic, strong) NSArray *renderArray;

@property(nonatomic, strong) CAEmitterLayer *emitterLayer;

@end

@implementation CAEmitterLayerNormalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *shapeTitleArray = @[@"Point", @"Line", @"Rectangle", @"Cuboid", @"Circle", @"Sphere"];
    self.shapeSegmentedControl = [[UISegmentedControl alloc] initWithItems:shapeTitleArray];
    self.shapeSegmentedControl.frame = CGRectMake(20, 100, [UIScreen mainScreen].bounds.size.width-40 , 44);
    self.shapeSegmentedControl.selectedSegmentIndex = 0;
    [self.view addSubview:self.shapeSegmentedControl];
    
    // 发射源形状
    self.shapeArray = @[kCAEmitterLayerPoint,       // 点形状
                        kCAEmitterLayerLine,        // 线性形状
                        kCAEmitterLayerRectangle,   // 矩形形状
                        kCAEmitterLayerCuboid,      // 长方体形状
                        kCAEmitterLayerCircle,      // 圆形形状
                        kCAEmitterLayerSphere];     // 球体形状

    NSArray *modeTitleArray = @[@"Points", @"Outline", @"Surface", @"Volume"];
    self.modeSegmentedControl = [[UISegmentedControl alloc] initWithItems:modeTitleArray];
    self.modeSegmentedControl.frame = CGRectMake(20, 150, [UIScreen mainScreen].bounds.size.width-40 , 44);
    self.modeSegmentedControl.selectedSegmentIndex = 0;
    [self.view addSubview:self.modeSegmentedControl];
    
    // 发散形式
    self.modeArray = @[kCAEmitterLayerPoints,       // 点, 在点的位置发射粒子
                       kCAEmitterLayerOutline,      // 边框, 在边框上发射粒子
                       kCAEmitterLayerSurface,      // 区域, 在区域内发射粒子
                       kCAEmitterLayerVolume];      // 容积, 在3D图形的体积内内发射粒子
    
    NSArray *renderTitleArray = @[@"Unordered", @"OldestFirst", @"OldestLast", @"BackToFront", @"Additive"];
    self.renderSegmentedControl = [[UISegmentedControl alloc] initWithItems:renderTitleArray];
    self.renderSegmentedControl.frame = CGRectMake(20, 200, [UIScreen mainScreen].bounds.size.width-40 , 44);
    self.renderSegmentedControl.selectedSegmentIndex = 0;
    [self.view addSubview:self.renderSegmentedControl];
    
    // 绘制模式
    self.renderArray = @[kCAEmitterLayerUnordered,      // 无序出现的，多个发射源将混合
                         kCAEmitterLayerOldestFirst,    // 声明久的粒子会被渲染在最上层
                         kCAEmitterLayerOldestLast,     // 年轻的粒子会被渲染在最上层
                         kCAEmitterLayerBackToFront,    // 粒子的渲染按照Z轴的前后顺序进行
                         kCAEmitterLayerAdditive];      // 进行粒子混合
    
    
    UIButton *startButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 250, 100, 30)];
    [startButton setTitle:@"start" forState:UIControlStateNormal];
    [startButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:startButton];
    
    [startButton addTarget:self action:@selector(onStartClick:) forControlEvents:UIControlEventTouchUpInside];
        
    self.emitterLayer = [CAEmitterLayer layer];
    self.emitterLayer.frame = self.view.bounds;

    // 发射源中心点位置，默认是 (0, 0, 0)
    self.emitterLayer.emitterPosition = CGPointMake(self.view.center.x, 150);
    self.emitterLayer.emitterZPosition = 10;
    
    // 发射源大小，宽、高和纵向深度。默认是 (0, 0, 0)
    self.emitterLayer.emitterSize = CGSizeMake(200, 50);
    self.emitterLayer.emitterDepth = 10;
}

- (void)onStartClick:(UIButton *)sender {
    NSLog(@"onStartClick");
    
    [self.emitterLayer removeFromSuperlayer];
    
    // 发射源的形状
    self.emitterLayer.emitterShape = self.shapeArray[self.shapeSegmentedControl.selectedSegmentIndex];
    self.emitterLayer.emitterMode = self.modeArray[self.modeSegmentedControl.selectedSegmentIndex];
    self.emitterLayer.renderMode = self.renderArray[self.renderSegmentedControl.selectedSegmentIndex];
    
    CAEmitterCell *cell = [CAEmitterCell emitterCell];
    cell.contents = (id)[UIImage imageNamed:@"launch"].CGImage;
    cell.birthRate = 1;
    cell.lifetime = 8;
    cell.scale = 0.2;
    cell.velocity = 30;
//    cell.yAcceleration = 20;
    
    self.emitterLayer.emitterCells = @[cell];

    CAEmitterAnimationViewController *vc = [[CAEmitterAnimationViewController alloc] init];
    vc.emitterLayer = self.emitterLayer;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
