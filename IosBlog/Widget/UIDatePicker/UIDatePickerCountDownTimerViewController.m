//
//  UIDatePickerCountDownTimerViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/4/9.
//

#import "UIDatePickerCountDownTimerViewController.h"

@interface UIDatePickerCountDownTimerViewController ()

@end

@implementation UIDatePickerCountDownTimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width - 20;
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 60, width, 50)];
    titleLabel.text = @"计时模式";
    [titleLabel setFont: [UIFont boldSystemFontOfSize:17]];
    [self.view addSubview:titleLabel];
         
    UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(10, 120, width, 200)];
    datePicker.datePickerMode = UIDatePickerModeCountDownTimer;
    datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    
    [self.view addSubview: datePicker];

    UIDatePicker *intervalDatePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(10, 320, width, 200)];
    intervalDatePicker.datePickerMode = UIDatePickerModeCountDownTimer;
    intervalDatePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    intervalDatePicker.minuteInterval = 15;
    intervalDatePicker.countDownDuration = 60 * 60;
    
    [self.view addSubview: intervalDatePicker];

}

@end
