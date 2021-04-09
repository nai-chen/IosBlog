//
//  UIPickerViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/4/9.
//

#import "UIPickerViewController.h"

@interface UIPickerViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, retain) NSArray* cityArray;
@property (nonatomic, assign) NSInteger selectProvince;
@property (nonatomic, assign) NSInteger selectCity;

@end

@implementation UIPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.cityArray = @[@{
                           @"province" : @"江苏",
                           @"city" : @[@"南京市", @"无锡市", @"徐州市", @"常州市", @"苏州市", @"南通市",
                                       @"连云港市", @"淮安市", @"盐城市", @"扬州市", @"镇江市", @"泰州市", @"宿迁市"]
                    }, @{
                           @"province" : @"浙江",
                           @"city" : @[@"杭州", @"宁波", @"温州", @"绍兴", @"湖州",
                                       @"嘉兴", @"金华", @"衢州", @"台州", @"丽水", @"舟山"]
                    }];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    UIPickerView* pickView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 100, width, 200)];
    pickView.delegate = self;
    pickView.dataSource = self;
    
    self.selectProvince = 0;
    self.selectCity = 0;
    
    [self.view addSubview: pickView];
}

#pragma mark - UIPickerViewDataSource -
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return self.cityArray.count;
    } else {
        NSArray* city = self.cityArray[component][@"city"];
        return city.count;
    }
}

#pragma mark - UIPickerViewDelegate -
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        return self.cityArray[row][@"province"];
    } else {
        NSArray* city = self.cityArray[self.selectProvince][@"city"];
        return city[row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        self.selectProvince = row;
        // 选中省份后，刷新城市列表，选中第一行
        self.selectCity = 0;
        [pickerView reloadComponent:1];
        [pickerView selectRow:0 inComponent:1 animated:YES];
    } else if (component == 1) {
        self.selectCity = row;
    }
    NSLog(@"selectProvince = %@ selectCity = %@", self.cityArray[self.selectProvince][@"province"],
            self.cityArray[self.selectProvince][@"city"][self.selectCity]);
}

@end
