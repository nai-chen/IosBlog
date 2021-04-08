//
//  UIStepperViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/4/8.
//

#import "UIStepperViewController.h"
#import "UIColor+Tool.h"

@interface UIStepperViewController ()

@end

@implementation UIStepperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIStepper* normalStepper = [[UIStepper alloc] initWithFrame:CGRectMake(50, 100, 200, 50)];
    [normalStepper addTarget:self action:@selector(onStepperValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview: normalStepper];
    
    UIStepper* valueStepper = [[UIStepper alloc] initWithFrame:CGRectMake(50, 150, 200, 50)];
    valueStepper.minimumValue = 2;
    valueStepper.maximumValue = 20;
    valueStepper.stepValue = 2;
    valueStepper.wraps = YES;
    valueStepper.autorepeat = NO;
    valueStepper.continuous = NO;
    [valueStepper addTarget:self action:@selector(onStepperValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview: valueStepper];
    
    UIStepper* imageStepper = [[UIStepper alloc] initWithFrame:CGRectMake(50, 200, 200, 50)];
    [imageStepper setBackgroundImage:[[UIColor whiteColor] colorToImage] forState: UIControlStateNormal];
    [imageStepper setDividerImage:[[UIColor blueColor] colorToImage] forLeftSegmentState:UIControlStateNormal rightSegmentState: UIControlStateNormal];
    [imageStepper setDividerImage:[[UIColor blueColor] colorToImage] forLeftSegmentState:UIControlStateHighlighted rightSegmentState:UIControlStateNormal];
    [imageStepper setDividerImage:[[UIColor blueColor] colorToImage] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateHighlighted];
    imageStepper.layer.borderColor = [UIColor blueColor].CGColor;
    imageStepper.layer.borderWidth = 1;
    imageStepper.layer.cornerRadius = 8;
    [imageStepper setTintColor:[UIColor redColor]];
    [imageStepper setIncrementImage: [UIImage imageNamed:@"user_xiaoxi"] forState:UIControlStateNormal];
    [imageStepper setDecrementImage: [UIImage imageNamed:@"user_kefu"] forState:UIControlStateNormal];

    [imageStepper addTarget:self action:@selector(onStepperValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview: imageStepper];

}

-(void) onStepperValueChanged: (UIStepper*) sender {
    NSLog(@"UIStepper.value = %f", sender.value);
}

@end
