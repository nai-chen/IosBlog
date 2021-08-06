//
//  NSUserDefaultsViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/5/13.
//

#import "NSUserDefaultsViewController.h"

@interface NSUserDefaultsViewController ()

@property (nonatomic, strong) UILabel *valueLabel;
@end

@implementation NSUserDefaultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [[NSUserDefaults standardUserDefaults] registerDefaults:@{@"name": @"Peter", @"age": @18}];

    UIButton *getButton = [[UIButton alloc] initWithFrame: CGRectMake(25, 100, 100, 40)];
    [getButton setTitle: @"Get Value" forState:UIControlStateNormal];
    [getButton setTitleColor: [UIColor blueColor] forState:UIControlStateNormal];
    [getButton addTarget:self action:@selector(onGetClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: getButton];
    
    UIButton *setButton = [[UIButton alloc] initWithFrame: CGRectMake(150, 100, 100, 40)];
    [setButton setTitle: @"Set Value" forState:UIControlStateNormal];
    [setButton setTitleColor: [UIColor blueColor] forState:UIControlStateNormal];
    [setButton addTarget:self action:@selector(onSetClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: setButton];

    self.valueLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 150, 200, 30)];
    [self.valueLabel setFont: [UIFont systemFontOfSize:17]];
    self.valueLabel.textColor = [UIColor blackColor];
    [self.view addSubview:self.valueLabel];
}

-(void) onGetClick: (UIButton*) sender {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    self.valueLabel.text = [NSString stringWithFormat:@"name=%@, age=%ld",
                    [userDefaults stringForKey:@"name"], [userDefaults integerForKey:@"age"]];
}

-(void) onSetClick: (UIButton*) sender {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setValue:@"Jack" forKey:@"name"];
    [userDefaults setInteger:20 forKey:@"age"];
    [userDefaults synchronize];
}

@end
