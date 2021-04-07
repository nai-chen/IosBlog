//
//  UISegmentedControlEventViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/4/7.
//

#import "UISegmentedControlEventViewController.h"

@interface UISegmentedControlEventViewController ()

@end

@implementation UISegmentedControlEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray* titleArray = @[@"东", @"南", @"西", @"北", @"这个选项有点长"];
    
    UISegmentedControl* normalSegmentedControl = [[UISegmentedControl alloc] initWithItems:titleArray];
    normalSegmentedControl.frame = CGRectMake(10, 100, [UIScreen mainScreen].bounds.size.width-20 , 44);
    normalSegmentedControl.selectedSegmentIndex = 1;
    [normalSegmentedControl addTarget:self action:@selector(onSegmentedControlValueChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:normalSegmentedControl];
}

-(void)onSegmentedControlValueChange: (UISegmentedControl*) sender {
    NSLog(@"selectedSegmentIndex = %ld", sender.selectedSegmentIndex);
}

@end
