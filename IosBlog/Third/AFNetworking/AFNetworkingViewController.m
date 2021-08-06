//
//  AFNetworkingViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/4/30.
//

#import "AFNetworkingViewController.h"
#import "AFNetworking.h"

@interface AFNetworkingViewController ()

@end

@implementation AFNetworkingViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *btnGet = [[UIButton alloc] initWithFrame:CGRectMake(10, 100, 100, 40)];
    [btnGet setTitle:@"Get" forState:UIControlStateNormal];
    [btnGet setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btnGet addTarget:self action:@selector(onBtnGetClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnGet];
    
    UIButton *btnPost = [[UIButton alloc] initWithFrame:CGRectMake(10, 160, 100, 40)];
    [btnPost setTitle:@"Post" forState:UIControlStateNormal];
    [btnPost setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btnPost addTarget:self action:@selector(onBtnPostClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnPost];
}

-(void) onBtnGetClick: (UIButton *) sender {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];

    [manager GET:@"http://www.baidu.com" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"success = %@", responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"fail %@", error);
        }];
}

-(void) onBtnPostClick: (UIButton *) sender {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];

    NSDictionary *dict = @{@"wd" : @"NSURL"};
    [manager POST:@"http://www.baidu.com/s" parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"succsee = %@", responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"fail");
        }];
}

@end
