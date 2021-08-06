//
//  UISliderViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/4/7.
//

#import "UISliderViewController.h"

@interface UISliderViewController ()

@end

@implementation UISliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width - 100;
    UISlider *normalSlider = [[UISlider alloc] initWithFrame:CGRectMake(50, 100, width, 80)];
    normalSlider.value = 0.2f;
    [normalSlider addTarget:self action:@selector(onSliderValueChanged:)
           forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:normalSlider];

    UISlider *valueSlider = [[UISlider alloc] initWithFrame:CGRectMake(50, 200, width, 80)];
    valueSlider.minimumValue = 1;
    valueSlider.maximumValue = 100;
    valueSlider.value = 20;
    valueSlider.continuous = NO;
    valueSlider.minimumValueImage = [UIImage imageNamed:@"icon_jian"];
    valueSlider.maximumValueImage = [UIImage imageNamed:@"icon_jia"];
    valueSlider.minimumTrackTintColor = [UIColor greenColor];
    valueSlider.maximumTrackTintColor = [UIColor redColor];
    valueSlider.thumbTintColor = [UIColor magentaColor];
    [valueSlider addTarget:self action:@selector(onSliderValueChanged:)
          forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:valueSlider];
    
    UISlider *imageSlider = [[UISlider alloc] initWithFrame:CGRectMake(50, 300, width, 80)];
    [imageSlider setThumbImage:[UIImage imageNamed:@"icon_money_b"] forState:UIControlStateNormal];
    [imageSlider setThumbImage:[UIImage imageNamed:@"icon_money_r"] forState:UIControlStateHighlighted];
    imageSlider.value = 0.2f;
    [self.view addSubview:imageSlider];
}

- (void)onSliderValueChanged:(UISlider *)sender {
    NSLog(@"Slider value = %f", sender.value);
}

@end
