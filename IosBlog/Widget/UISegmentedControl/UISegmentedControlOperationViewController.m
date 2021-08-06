//
//  UISegmentedControlOperationViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/4/6.
//

#import "UISegmentedControlOperationViewController.h"

@interface UISegmentedControlOperationViewController ()

@property (nonatomic, retain) UISegmentedControl *operationSegmentedControl;
 
@end

@implementation UISegmentedControlOperationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *titleArray = @[@"东", @"南", @"西", @"北"];
    
    self.operationSegmentedControl = [[UISegmentedControl alloc] initWithItems:titleArray];
    self.operationSegmentedControl.frame = CGRectMake(10, 100, [UIScreen mainScreen].bounds.size.width-20 , 44);
    [self.view addSubview:self.operationSegmentedControl];
    
    UIButton *btnInsert = [[UIButton alloc] initWithFrame:CGRectMake(10, 200, 80, 50)];
    [btnInsert setTitle:@"Insert" forState:UIControlStateNormal];
    [btnInsert setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnInsert addTarget:self action:@selector(insertAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnInsert];
    
    UIButton *btnRemove = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 80, 50)];
    [btnRemove setTitle:@"Remove" forState:UIControlStateNormal];
    [btnRemove setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnRemove addTarget:self action:@selector(removeAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnRemove];
}

- (void)insertAction:(UIButton *)sender {
    [self.operationSegmentedControl insertSegmentWithTitle:@"中" atIndex:2 animated:YES];
}

- (void)removeAction:(UIButton *)sender {
    [self.operationSegmentedControl removeSegmentAtIndex:2 animated:YES];
}

@end
