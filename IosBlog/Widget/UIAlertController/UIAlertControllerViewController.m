//
//  UIAlertControllerViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/4/9.
//

#import "UIAlertControllerViewController.h"

@interface UIAlertControllerViewController ()

@end

@implementation UIAlertControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton* alertTwoButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 80, 100, 60)];
    [alertTwoButton setTitle:@"alertTwo" forState:UIControlStateNormal];
    [alertTwoButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [alertTwoButton addTarget:self action:@selector(onAlertTwoAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: alertTwoButton];
    
    UIButton* alertThreeButton = [[UIButton alloc] initWithFrame:CGRectMake(150, 80, 100, 60)];
    [alertThreeButton setTitle:@"alertThree" forState:UIControlStateNormal];
    [alertThreeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [alertThreeButton addTarget:self action:@selector(onAlertThreeAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: alertThreeButton];


    UIButton* actionSheetButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 150, 100, 60)];
    [actionSheetButton setTitle:@"actionSheet" forState:UIControlStateNormal];
    [actionSheetButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [actionSheetButton addTarget:self action:@selector(onActionSheetAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: actionSheetButton];
}

-(void) onAlertTwoAction:(UIButton*) sender {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"标题" message:@"这是一个测试"
                                    preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入";
    }];
    [alert addAction:[UIAlertAction actionWithTitle:@"默认" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action){
        NSLog(@"text = %@", alert.textFields.firstObject.text);
        NSLog(@"默认按钮");
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction* action){
        NSLog(@"取消按钮");
    }]];
    [self presentViewController:alert animated:YES completion:^(){
        NSLog(@"alert completion");
    }];
}

-(void) onAlertThreeAction:(UIButton*) sender {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"标题" message:@"这是一个测试"
                                    preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"默认" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action){
        NSLog(@"默认按钮");
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction* action){
        NSLog(@"取消按钮");
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"警示" style:UIAlertActionStyleDestructive handler:^(UIAlertAction* action){
        NSLog(@"警示按钮");
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void) onActionSheetAction:(UIButton*) sender {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"标题" message:@"这是一个测试"
                                    preferredStyle:UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:@"选项一" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action){
        NSLog(@"按钮一");
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"选项二" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action){
        NSLog(@"按钮二");
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction* action){
        NSLog(@"取消按钮");
    }]];

    [self presentViewController:alert animated:YES completion:nil];
}

@end
