//
//  UISwitchNormalViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/4/1.
//

#import "UISwitchNormalViewController.h"

@interface UISwitchNormalViewController ()

@end

@implementation UISwitchNormalViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UISwitch *normalSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(20, 100, 150, 50)];
    [normalSwitch addTarget:self action:@selector(onSwitchValueChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:normalSwitch];
    
    UISwitch *frameSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(100, 100, 200, 75)];
    // 是否开启,默认是NO
    frameSwitch.on = YES;
    [self.view addSubview:frameSwitch];
    
    UISwitch *largeSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(25, 150, 150, 50)];
    largeSwitch.transform = CGAffineTransformMakeScale(1.2, 1.2);
    [self.view addSubview:largeSwitch];
    
    UISwitch *leftCustomSwitch = [self makeCustomSwitch];
    leftCustomSwitch.frame = CGRectMake(20, 220, 150, 50);
    [self.view addSubview:leftCustomSwitch];
    
    UISwitch *rightCustomSwitch = [self makeCustomSwitch];
    rightCustomSwitch.frame = CGRectMake(100, 220, 150, 50);
    rightCustomSwitch.on = true;
    [self.view addSubview:rightCustomSwitch];
}

-(UISwitch *)makeCustomSwitch {
    UISwitch *customSwitch = [[UISwitch alloc] init];
    // 控件开启状态的填充色
    customSwitch.onTintColor = [UIColor magentaColor];
    // 控件关闭状态的边界色
    customSwitch.tintColor = [UIColor blackColor];
    // 控件开关按钮的颜色
    customSwitch.thumbTintColor = [UIColor blueColor];

    customSwitch.backgroundColor = [UIColor orangeColor];
    customSwitch.layer.cornerRadius = 15;
    customSwitch.layer.masksToBounds = YES;

    return customSwitch;
}

-(void)onSwitchValueChange:(UISwitch *)sender {
    if (sender.isOn) {
        NSLog(@"on");
    } else {
        NSLog(@"off");
    }
}

@end
