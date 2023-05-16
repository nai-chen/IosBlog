//
//  OpenUDIDViewController.m
//  IosBlog
//
//  Created by PeterChen on 2022/1/17.
//

#import "OpenUDIDViewController.h"
#import "OpenUDID.h"

@interface OpenUDIDViewController ()

@end

@implementation OpenUDIDViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 200, 40)];
    [label setFont:[UIFont systemFontOfSize:16]];
    [label setTextColor:[UIColor blueColor]];
    label.text = [OpenUDID value];
    label.numberOfLines = 0;
    
    [self.view addSubview:label];
    
    NSLog(@"%@", [OpenUDID value]);
}


@end
