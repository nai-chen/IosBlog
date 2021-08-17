//
//  NSKeyedArchiverViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/5/18.
//

#import "NSKeyedArchiverViewController.h"
#import "Person.h"

@interface NSKeyedArchiverViewController ()

@property(nonatomic, copy) NSString *dataPath;

@end

@implementation NSKeyedArchiverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    self.dataPath = [docPath stringByAppendingPathComponent:@"ios.archiver"];
    
    UIButton *writeStrToFileBtn = [[UIButton alloc] initWithFrame:CGRectMake(25, 100, 200, 60)];
    [writeStrToFileBtn setTitle:@"Write Str" forState:UIControlStateNormal];
    [writeStrToFileBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [writeStrToFileBtn addTarget:self action:@selector(stringArchiver) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: writeStrToFileBtn];
    
    UIButton *readStrFromFileBtn = [[UIButton alloc] initWithFrame:CGRectMake(25, 160, 200, 60)];
    [readStrFromFileBtn setTitle:@"Read Str" forState:UIControlStateNormal];
    [readStrFromFileBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [readStrFromFileBtn addTarget:self action:@selector(stringUnarchiver) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: readStrFromFileBtn];
    
    UIButton *writeobjToFileBtn = [[UIButton alloc] initWithFrame:CGRectMake(25, 220, 200, 60)];
    [writeobjToFileBtn setTitle:@"Write Obj" forState:UIControlStateNormal];
    [writeobjToFileBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [writeobjToFileBtn addTarget:self action:@selector(objectArchiver) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: writeobjToFileBtn];
    
    UIButton *readObjFromFileBtn = [[UIButton alloc] initWithFrame:CGRectMake(25, 280, 200, 60)];
    [readObjFromFileBtn setTitle:@"Read Obj" forState:UIControlStateNormal];
    [readObjFromFileBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [readObjFromFileBtn addTarget:self action:@selector(objectUnarchiver) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: readObjFromFileBtn];

}

- (void)stringArchiver {
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:@"Hello World" requiringSecureCoding:YES error:nil];
    [data writeToFile:self.dataPath options:0 error:nil];
}

- (void)stringUnarchiver {
    NSData *data = [NSData dataWithContentsOfFile:self.dataPath options:0 error:nil];
    NSString *str = [NSKeyedUnarchiver unarchivedObjectOfClass:[NSString class] fromData:data error:nil];
        
    NSLog(@"%@", str);
}

- (void)objectArchiver {
    Person *person = [[Person alloc] init];
    person.name = @"Jack";
    person.age = 18;
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:person requiringSecureCoding:YES error:nil];
    [data writeToFile:self.dataPath options:0 error:nil];
}

- (void)objectUnarchiver {
    NSData *data = [NSData dataWithContentsOfFile:self.dataPath options:0 error:nil];
    Person *person  = [NSKeyedUnarchiver unarchivedObjectOfClass:[Person class] fromData:data error:nil];
        
    NSLog(@"%@", person);
}

@end
