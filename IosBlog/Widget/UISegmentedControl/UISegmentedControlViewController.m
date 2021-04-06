//
//  UISegmentedControlViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/4/6.
//

#import "UISegmentedControlViewController.h"

@interface UISegmentedControlViewController ()

@property (nonatomic, assign) NSArray* titleArray;

@end

@implementation UISegmentedControlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray* titleArray = @[@"东", @"南", @"西", @"北"];
    
    UISegmentedControl* normalSegmentedControl = [[UISegmentedControl alloc] initWithItems:titleArray];
    normalSegmentedControl.frame = CGRectMake(10, 100, [UIScreen mainScreen].bounds.size.width-20 , 44);
    [self.view addSubview:normalSegmentedControl];

    UISegmentedControl* customSegmentedControl = [[UISegmentedControl alloc] initWithItems:titleArray];
    customSegmentedControl.frame = CGRectMake(10, 180, [UIScreen mainScreen].bounds.size.width-20 , 44);
    customSegmentedControl.backgroundColor = [UIColor whiteColor];
    customSegmentedControl.tintColor = [UIColor blueColor];
    [self.view addSubview:customSegmentedControl];
}


@end
