//
//  AnimationSpringViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/5/10.
//

#import "AnimationSpringViewController.h"

@interface AnimationSpringViewController ()

@property (nonatomic, strong) UILabel* lowLabel;
@property (nonatomic, strong) UILabel* middleLabel;
@property (nonatomic, strong) UILabel* highLabel;
@property (nonatomic, strong) UIImageView* lowImageView;
@property (nonatomic, strong) UIImageView* middleImageView;
@property (nonatomic, strong) UIImageView* highImageView;

@end

@implementation AnimationSpringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.lowLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, 82, 20)];
    self.lowLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview: self.lowLabel];
    
    self.lowImageView = [[UIImageView alloc] initWithFrame:CGRectMake(25, 400, 32, 32)];
    self.lowImageView.image = [UIImage imageNamed:@"icon_star"];
    [self.view addSubview: self.lowImageView];
    
    self.middleLabel = [[UILabel alloc] initWithFrame:CGRectMake(125, 80, 82, 20)];
    self.middleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview: self.middleLabel];
    
    self.middleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(150, 400, 32, 32)];
    self.middleImageView.image = [UIImage imageNamed:@"icon_star"];
    [self.view addSubview: self.middleImageView];
    
    self.highLabel = [[UILabel alloc] initWithFrame:CGRectMake(250, 80, 82, 20)];
    self.highLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview: self.highLabel];
    
    self.highImageView = [[UIImageView alloc] initWithFrame:CGRectMake(275, 400, 32, 32)];
    self.highImageView.image = [UIImage imageNamed:@"icon_star"];
    [self.view addSubview: self.highImageView];
    
    
    UIButton* dampingRatioButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 450, 200, 30)];
    [dampingRatioButton setTitle:@"dampingRatio animation" forState:UIControlStateNormal];
    [dampingRatioButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [dampingRatioButton addTarget:self action:@selector(onDampingRatioAnimationClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: dampingRatioButton];
    
    UIButton* velocityButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 480, 200, 30)];
    [velocityButton setTitle:@"velocity" forState:UIControlStateNormal];
    [velocityButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [velocityButton addTarget:self action:@selector(onVelocityAnimationClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: velocityButton];

    UIButton* resetButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 510, 200, 30)];
    [resetButton setTitle:@"reset" forState:UIControlStateNormal];
    [resetButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [resetButton addTarget:self action:@selector(onResetClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: resetButton];
}

-(void) onDampingRatioAnimationClick:(UIButton*)sender {
    self.lowLabel.text = @"0.2";
    self.middleLabel.text = @"0.5";
    self.highLabel.text = @"1.0";
    
    [UIView animateWithDuration:1 delay:2 usingSpringWithDamping:0.2
          initialSpringVelocity:0.5 options:0 animations:^{
        self.lowImageView.frame = CGRectMake(25, 100, 32, 32);
    } completion:nil];
    
    [UIView animateWithDuration:1 delay:2 usingSpringWithDamping:0.5
          initialSpringVelocity:0.5 options:0 animations:^{
        self.middleImageView.frame = CGRectMake(150, 100, 32, 32);
    } completion:nil];

    [UIView animateWithDuration:1 delay:2 usingSpringWithDamping:1
          initialSpringVelocity:0.5 options:0 animations:^{
        self.highImageView.frame = CGRectMake(275, 100, 32, 32);
    } completion:nil];

}

-(void) onVelocityAnimationClick:(UIButton*)sender {
    self.lowLabel.text = @"5";
    self.middleLabel.text = @"10";
    self.highLabel.text = @"20";
    
    [UIView animateWithDuration:1 delay:2 usingSpringWithDamping:0.5
          initialSpringVelocity:5 options:UIViewAnimationOptionCurveLinear animations:^{
        self.lowImageView.frame = CGRectMake(25, 100, 32, 32);
    } completion:nil];
    
    [UIView animateWithDuration:1 delay:2 usingSpringWithDamping:0.5
          initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
        self.middleImageView.frame = CGRectMake(150, 100, 32, 32);
    } completion:nil];

    [UIView animateWithDuration:1 delay:2 usingSpringWithDamping:0.5
          initialSpringVelocity:20 options:UIViewAnimationOptionCurveLinear animations:^{
        self.highImageView.frame = CGRectMake(275, 100, 32, 32);
    } completion:nil];
}

-(void) onResetClick: (UIButton*) sender {
    self.lowImageView.frame = CGRectMake(25, 400, 32, 32);
    self.middleImageView.frame = CGRectMake(150, 400, 32, 32);
    self.highImageView.frame = CGRectMake(275, 400, 32, 32);
    
    self.lowLabel.text = @"";
    self.middleLabel.text = @"";
    self.highLabel.text = @"";
}

@end
