//
//  SandboxViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/5/18.
//

#import "SandboxViewController.h"
#import "Tool.h"

@interface SandboxViewController ()

@end

@implementation SandboxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 80, kDeviceWidth - 50, kDeviceHeight - 80)];
    contentLabel.numberOfLines = 0;
    [contentLabel setFont: [UIFont systemFontOfSize:17]];
    contentLabel.textColor = [UIColor blackColor];
    [self.view addSubview:contentLabel];

    NSMutableString *content = [[NSMutableString alloc] init];

    NSString *homeDirectory = NSHomeDirectory();
    [content appendFormat: @"HomeDirectory = %@\n", homeDirectory];
    
    NSArray *documentArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true);
    if (documentArray) {
        [content appendFormat:@"Document = %@\n", [documentArray firstObject]];
    }
    NSArray *cacheArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, false);
    if (cacheArray) {
        [content appendFormat:@"Cache = %@\n", [cacheArray firstObject]];
    }
    NSString *temporaryDirectory = NSTemporaryDirectory();
    [content appendFormat: @"TemporaryDirectory = %@\n", temporaryDirectory];
    
    contentLabel.text = content;
}

@end
