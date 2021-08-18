//
//  UISegmentedControlViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/4/6.
//

#import "UISegmentedControlNormalViewController.h"

@interface UISegmentedControlNormalViewController ()

@property(nonatomic, assign) NSArray *titleArray;

@end

@implementation UISegmentedControlNormalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *titleArray = @[@"东", @"南", @"西", @"北", @"这个选项有点长"];
    
    UISegmentedControl *normalSegmentedControl = [[UISegmentedControl alloc] initWithItems:titleArray];
    normalSegmentedControl.frame = CGRectMake(10, 100, [UIScreen mainScreen].bounds.size.width-20 , 44);
    normalSegmentedControl.selectedSegmentIndex = 1;
    [self.view addSubview:normalSegmentedControl];
    
    UISegmentedControl *selectSegmentedControl = [[UISegmentedControl alloc] initWithItems:titleArray];
    selectSegmentedControl.frame = CGRectMake(10, 180, [UIScreen mainScreen].bounds.size.width-20 , 44);
    selectSegmentedControl.selectedSegmentIndex = 1;
    if (@available(iOS 13.0, *)) {
        selectSegmentedControl.selectedSegmentTintColor = [UIColor magentaColor];
    }
    [self.view addSubview:selectSegmentedControl];
    
    UISegmentedControl *momentarySegmentedControl = [[UISegmentedControl alloc] initWithItems:titleArray];
    momentarySegmentedControl.frame = CGRectMake(10, 260, [UIScreen mainScreen].bounds.size.width-20 , 44);
    momentarySegmentedControl.momentary = YES;
    [self.view addSubview:momentarySegmentedControl];

    UISegmentedControl *apportionsSegmentedControl = [[UISegmentedControl alloc] initWithItems:titleArray];
    apportionsSegmentedControl.frame = CGRectMake(10, 340, [UIScreen mainScreen].bounds.size.width-20 , 44);
    apportionsSegmentedControl.selectedSegmentIndex = 1;
    apportionsSegmentedControl.apportionsSegmentWidthsByContent = YES;
    [self.view addSubview:apportionsSegmentedControl];
}


@end
