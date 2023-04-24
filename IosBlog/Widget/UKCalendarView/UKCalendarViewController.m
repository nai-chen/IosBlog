//
//  UKCalendarViewController.m
//  IosBlog
//
//  Created by PC010055 on 2023/4/21.
//

#import "UKCalendarViewController.h"

#import "UKCalendarView.h"

@implementation UKCalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UKCalendarView *calendarView = [[UKCalendarView alloc] initWithFrame:CGRectMake(0, kStatusBarHeight + 50, kScreenWidth, 74 + 40 *6)];
    [self.view addSubview:calendarView];
}

@end
