//
//  NSNoticationViewController.m
//  IosBlog
//
//  Created by PeterChen on 2020/11/18.
//

#import "NSNoticationViewController.h"

@interface NSNoticationViewController ()

@end

@implementation NSNoticationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton* addObserverBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 100, 320, 30)];
    [addObserverBtn setTitle:@"Add Observer" forState:UIControlStateNormal];
    [addObserverBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [addObserverBtn addTarget:self action:@selector(addObserver:) forControlEvents:UIControlEventTouchUpInside];
    addObserverBtn.tag = 1;
    [self.view addSubview: addObserverBtn];
    
    UIButton* addObserverWithObjectBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 150, 320, 30)];
    [addObserverWithObjectBtn setTitle:@"Add Observer With Object" forState:UIControlStateNormal];
    [addObserverWithObjectBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [addObserverWithObjectBtn addTarget:self action:@selector(addObserver:) forControlEvents:UIControlEventTouchUpInside];
    addObserverWithObjectBtn.tag = 2;
    [self.view addSubview: addObserverWithObjectBtn];
    
    UIButton* postNotificationBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 250, 320, 30)];
    [postNotificationBtn setTitle:@"Post Notification" forState:UIControlStateNormal];
    [postNotificationBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [postNotificationBtn addTarget:self action:@selector(postNotification:) forControlEvents:UIControlEventTouchUpInside];
    postNotificationBtn.tag = 1;
    [self.view addSubview: postNotificationBtn];
    
    UIButton* postNotificationWithObjectBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 300, 320, 30)];
    [postNotificationWithObjectBtn setTitle:@"Post Notification With Object" forState:UIControlStateNormal];
    [postNotificationWithObjectBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [postNotificationWithObjectBtn addTarget:self action:@selector(postNotification:) forControlEvents:UIControlEventTouchUpInside];
    postNotificationWithObjectBtn.tag = 2;
    [self.view addSubview: postNotificationWithObjectBtn];
    
    UIButton* postNotificationWithUserInfoBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 350, 320, 30)];
    [postNotificationWithUserInfoBtn setTitle:@"Post Notification With UserInfo" forState:UIControlStateNormal];
    [postNotificationWithUserInfoBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [postNotificationWithUserInfoBtn addTarget:self action:@selector(postNotification:) forControlEvents:UIControlEventTouchUpInside];
    postNotificationWithUserInfoBtn.tag = 3;
    [self.view addSubview: postNotificationWithUserInfoBtn];
    
    UIButton* removeObserverBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 450, 320, 30)];
    [removeObserverBtn setTitle:@"Remove Observer" forState:UIControlStateNormal];
    [removeObserverBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [removeObserverBtn addTarget:self action:@selector(removeObserver:) forControlEvents:UIControlEventTouchUpInside];
    removeObserverBtn.tag = 1;
    [self.view addSubview: removeObserverBtn];
    
    UIButton* removeObserverWithNameBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 500, 320, 30)];
    [removeObserverWithNameBtn setTitle:@"Remove Observer With Name" forState:UIControlStateNormal];
    [removeObserverWithNameBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [removeObserverWithNameBtn addTarget:self action:@selector(removeObserver:) forControlEvents:UIControlEventTouchUpInside];
    removeObserverWithNameBtn.tag = 2;
    [self.view addSubview: removeObserverWithNameBtn];
    
    UIButton* removeObserverWithObjectBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 550, 320, 30)];
    [removeObserverWithObjectBtn setTitle:@"Remove Observer With Object" forState:UIControlStateNormal];
    [removeObserverWithObjectBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [removeObserverWithObjectBtn addTarget:self action:@selector(removeObserver:) forControlEvents:UIControlEventTouchUpInside];
    removeObserverWithObjectBtn.tag = 3;
    [self.view addSubview: removeObserverWithObjectBtn];
}

-(void) addObserver:(id)sender {
    UIButton* btn = (UIButton*) sender;
    if (btn.tag == 1) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotication:) name:@"Notication" object:nil];
        NSLog(@"Add Observer");
    } else if (btn.tag == 2) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotication:) name:@"Notication" object:self];
        NSLog(@"Add Observer With Object");
    }
}

- (void) postNotification:(id)sender {
    UIButton* btn = (UIButton*) sender;
    if (btn.tag == 1) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Notication" object:nil];
        NSLog(@"Post Notication");
    } else if (btn.tag == 2) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Notication" object:self];
        NSLog(@"Post Notication With Object");
    } else if (btn.tag == 3) {
        NSNotification* notification = [NSNotification notificationWithName:@"Notication" object:self userInfo:@{@"tag" : @(3)}];
        [[NSNotificationCenter defaultCenter] postNotification:notification];
        NSLog(@"Post Notication With UserInfo");
    }
}

- (void) removeObserver:(id)sender {
    UIButton* btn = (UIButton*) sender;
    if (btn.tag == 1) {
        [[NSNotificationCenter defaultCenter] removeObserver:self];
        NSLog(@"Remove Observer");
    } else if (btn.tag == 2) {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:@"Notication" object:nil];
        NSLog(@"Remove Observer with Name");
    } else if (btn.tag == 3) {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:@"Notication" object:self];
        NSLog(@"Remove Observer with object");
    }
}

-(void) receiveNotication:(NSNotification*)notification {
    NSLog(@"receiveNotication %@ %@ %@", notification.name, notification.object, notification.userInfo);
}

@end
