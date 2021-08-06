//
//  NSURLSessionViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/4/30.
//

#import "NSURLSessionViewController.h"

@interface NSURLSessionViewController () <NSURLSessionDataDelegate>

@end

@implementation NSURLSessionViewController

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
    
    UIButton *btnDelegate = [[UIButton alloc] initWithFrame:CGRectMake(10, 220, 100, 40)];
    [btnDelegate setTitle:@"delegate" forState:UIControlStateNormal];
    [btnDelegate setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btnDelegate addTarget:self action:@selector(onBtnDelegateClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnDelegate];
}

- (void)onBtnGetClick:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString: @"http://www.baidu.com"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"get = %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    }];

    [task resume];
}

- (void)onBtnPostClick:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString: @"http://www.baidu.com/s"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: url];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [@"wd=NSURL" dataUsingEncoding:NSUTF8StringEncoding];

    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"post = %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    }];
    
    [task resume];
}

- (void)onBtnDelegateClick:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString: @"http://www.baidu.com"];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self
                                     delegateQueue:[NSOperationQueue mainQueue]];
    
    NSURLSessionTask *task = [session dataTaskWithURL:url];
    [task resume];
}


#pragma mark - NSURLSessionDataDelegate -
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler {
    NSLog(@"dataTask:didReceiveResponse:");
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    NSLog(@"dataTask:didReceiveData:");
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    NSLog(@"task:didCompleteWithError:");
}

@end
