//
//  UISegmentedControlSetViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/4/6.
//

#import "UISegmentedControlSetViewController.h"

#import "UIColor+Tool.h"

@interface UISegmentedControlSetViewController ()

@end

@implementation UISegmentedControlSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *titleArray = @[@"东", @"南", @"西", @"北", @"这个选项有点长"];
    
    UISegmentedControl *normalSegmentedControl = [[UISegmentedControl alloc] initWithItems:titleArray];
    normalSegmentedControl.frame = CGRectMake(10, 100, [UIScreen mainScreen].bounds.size.width-20 , 44);
    [self.view addSubview:normalSegmentedControl];
    
    [normalSegmentedControl setTitle:@"选项1" forSegmentAtIndex:0];
    [normalSegmentedControl setImage:[UIImage imageNamed:@"icon_money"] forSegmentAtIndex:1];
    [normalSegmentedControl setContentOffset:CGSizeMake(10, 10) forSegmentAtIndex:2];
    [normalSegmentedControl setWidth:120 forSegmentAtIndex:4];

    if (@available(iOS 13, *)) {
        [normalSegmentedControl setBackgroundImage:[[UIColor whiteColor] colorToImage]
                    forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [normalSegmentedControl setBackgroundImage:[[UIColor blueColor] colorToImage]
                    forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
        [normalSegmentedControl setDividerImage:[[UIColor blueColor] colorToImage]
                    forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal
                    barMetrics:UIBarMetricsDefault];
        [normalSegmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blueColor]}
                    forState:UIControlStateNormal];
        [normalSegmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}
                    forState:UIControlStateSelected];

        normalSegmentedControl.layer.borderWidth = 1;
        normalSegmentedControl.layer.borderColor = [UIColor blueColor].CGColor;
    } else {
        normalSegmentedControl.tintColor = [UIColor blueColor];
    }
    normalSegmentedControl.selectedSegmentIndex = 0;
}

@end
