//
//  UIDatePickerTimeViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/4/9.
//

#import "UIDatePickerTimeViewController.h"

@interface UIDatePickerTimeViewController ()

@end

@implementation UIDatePickerTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width - 20;
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 60, width, 50)];
    titleLabel.text = @"时间模式";
    [titleLabel setFont: [UIFont boldSystemFontOfSize:17]];
    [self.view addSubview:titleLabel];
     
    [self datePickerWithStyle:UIDatePickerStyleCompact frame:CGRectMake(10, 100, width, 50)];
    
    [self datePickerWithStyle:UIDatePickerStyleWheels frame:CGRectMake(10, 150, width, 200)];
    
    [self datePickerWithStyle:UIDatePickerStyleInline frame:CGRectMake(10, 350, width, 200)];
}

- (UIDatePicker *)datePickerWithStyle:(UIDatePickerStyle)style frame:(CGRect)frame {
    UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:frame];
    datePicker.datePickerMode = UIDatePickerModeTime;
    datePicker.preferredDatePickerStyle = style;
    datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    [self.view addSubview: datePicker];
    
    return datePicker;
}

@end
