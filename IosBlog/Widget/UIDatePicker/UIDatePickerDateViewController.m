//
//  UIDatePickerDateViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/4/9.
//

#import "UIDatePickerDateViewController.h"

@interface UIDatePickerDateViewController ()

@end

@implementation UIDatePickerDateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width - 20;
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 60, width, 50)];
    titleLabel.text = @"日期模式";
    [titleLabel setFont: [UIFont boldSystemFontOfSize:17]];
    [self.view addSubview:titleLabel];
     
    if (@available(iOS 14.0, *)) {
        [self datePickerWithStyle:UIDatePickerStyleCompact frame:CGRectMake(10, 100, width, 50)];
        
        [self datePickerWithStyle:UIDatePickerStyleWheels frame:CGRectMake(10, 150, width, 200)];
        
        UIDatePicker *datePicker = [self datePickerWithStyle:UIDatePickerStyleInline frame:CGRectMake(10, 350, width, 200)];
        
        NSDate *currentDate = [NSDate date];
        NSCalendar *calendar = [NSCalendar currentCalendar];

        datePicker.minimumDate = [calendar dateByAddingUnit:NSCalendarUnitMonth value:-12 toDate:currentDate options:0];
        datePicker.maximumDate = [calendar dateByAddingUnit:NSCalendarUnitMonth value:12 toDate:currentDate options:0];
        datePicker.date = [calendar dateByAddingUnit:NSCalendarUnitMonth value:1 toDate:currentDate options:0];
    }
}

- (UIDatePicker *)datePickerWithStyle:(UIDatePickerStyle)style frame:(CGRect)frame NS_AVAILABLE_IOS(14_0) {
    UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:frame];
    datePicker.datePickerMode = UIDatePickerModeDate;
    datePicker.preferredDatePickerStyle = style;
    datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    
    [datePicker addTarget:self action:@selector(onDatePickerValueChanged:)
        forControlEvents:UIControlEventValueChanged];
    [self.view addSubview: datePicker];
    
    return datePicker;
}

- (void)onDatePickerValueChanged:(UIDatePicker *)sender {
    NSLog(@"%@", sender.date);
}

@end
