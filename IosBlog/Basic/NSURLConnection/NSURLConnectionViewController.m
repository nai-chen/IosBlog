//
//  NSURLConnectionViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/4/30.
//

#import "NSURLConnectionViewController.h"

@interface NSURLConnectionViewController ()<NSURLConnectionDataDelegate>

@end

@implementation NSURLConnectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton* btnGet = [[UIButton alloc] initWithFrame:CGRectMake(10, 100, 100, 40)];
    [btnGet setTitle:@"Get" forState:UIControlStateNormal];
    [btnGet setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btnGet addTarget:self action:@selector(onBtnGetClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnGet];
    
    UIButton* btnPost = [[UIButton alloc] initWithFrame:CGRectMake(10, 160, 100, 40)];
    [btnPost setTitle:@"Post" forState:UIControlStateNormal];
    [btnPost setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btnPost addTarget:self action:@selector(onBtnPostClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnPost];
    
    UIButton* btnAsync = [[UIButton alloc] initWithFrame:CGRectMake(10, 220, 100, 40)];
    [btnAsync setTitle:@"async" forState:UIControlStateNormal];
    [btnAsync setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btnAsync addTarget:self action:@selector(onBtnAsyncClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnAsync];
    
    UIButton* btnDelegate = [[UIButton alloc] initWithFrame:CGRectMake(10, 280, 100, 40)];
    [btnDelegate setTitle:@"delegate" forState:UIControlStateNormal];
    [btnDelegate setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btnDelegate addTarget:self action:@selector(onBtnDelegateClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnDelegate];
}

-(void) onBtnGetClick: (UIButton*) sender {
    NSURL* url = [NSURL URLWithString: @"http://www.baidu.com"];
    NSURLRequest* request = [[NSURLRequest alloc] initWithURL: url];
    
    NSURLResponse* response = nil;
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse: &response error:nil];
    NSLog(@"get = %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
}

-(void) onBtnPostClick: (UIButton*) sender {
    NSURL* url = [NSURL URLWithString: @"http://www.baidu.com/s"];
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL: url];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [@"wd=NSURL" dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURLResponse* response = nil;
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse: &response error:nil];
    NSLog(@"post = %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
}

-(void) onBtnAsyncClick: (UIButton*) sender {
    NSURL* url = [NSURL URLWithString: @"http://www.baidu.com"];
    NSURLRequest* request = [[NSURLRequest alloc] initWithURL: url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        NSLog(@"async = %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    }];
}

-(void) onBtnDelegateClick: (UIButton*) sender {
    NSURL* url = [NSURL URLWithString: @"http://www.baidu.com"];
    NSURLRequest* request = [[NSURLRequest alloc] initWithURL: url];
    
    [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

#pragma mark - NSURLConnectionDataDelegate -
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"didReceiveResponse");
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSLog(@"didReceiveData");
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"connectionDidFinishLoading");
}


@end
