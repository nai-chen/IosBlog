//
//  PresentModalPopoverViewController.m
//  IosBlog
//
//  Created by PeterChen on 2022/1/11.
//

#import "PresentModalPopoverViewController.h"

@interface PresentModalPopoverViewController ()

@end

@implementation PresentModalPopoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 25, 180, 50)];
    label.text = @"This is a Popover View";
    label.textColor = [UIColor whiteColor];
    label.numberOfLines = 0;
    [self.view addSubview:label];
}

@end
