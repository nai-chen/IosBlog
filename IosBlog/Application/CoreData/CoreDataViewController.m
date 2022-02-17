//
//  CoreDataViewController.m
//  IosBlog
//
//  Created by PeterChen on 2022/2/16.
//

#import "CoreDataViewController.h"
#import <CoreData/CoreData.h>
#import "StudentModel+CoreDataProperties.h"

@interface CoreDataViewController () <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) NSManagedObjectModel *managedObjectModel;
@property(nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@property (nonatomic, strong) UITextField *nameTextField;
@property (nonatomic, strong) UITextField *ageTextField;

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray<StudentModel *> *data;

@property (nonatomic, strong) StudentModel *currentModel;

@end

@implementation CoreDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 70, 30)];
    nameLabel.text = @"name";
    nameLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:nameLabel];

    self.nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(80, 100, 150, 30)];
    self.nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.nameTextField];
    
    UILabel *ageLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 140, 70, 30)];
    ageLabel.text = @"age";
    ageLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:ageLabel];

    self.ageTextField = [[UITextField alloc] initWithFrame:CGRectMake(80, 140, 150, 30)];
    self.ageTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.ageTextField];
    
    UIButton *insertButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 180, 60, 30)];
    [insertButton setTitle:@"insert" forState:UIControlStateNormal];
    [insertButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:insertButton];
    
    [insertButton addTarget:self action:@selector(onInsertClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *editButton = [[UIButton alloc] initWithFrame:CGRectMake(80, 180, 60, 30)];
    [editButton setTitle:@"edit" forState:UIControlStateNormal];
    [editButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:editButton];
    
    [editButton addTarget:self action:@selector(onEditClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(160, 180, 60, 30)];
    [deleteButton setTitle:@"delete" forState:UIControlStateNormal];
    [deleteButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:deleteButton];
    
    [deleteButton addTarget:self action:@selector(onDeleteClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *queryButton = [[UIButton alloc] initWithFrame:CGRectMake(230, 180, 60, 30)];
    [queryButton setTitle:@"query" forState:UIControlStateNormal];
    [queryButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:queryButton];
    
    [queryButton addTarget:self action:@selector(onQueryClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 280, self.view.bounds.size.width, self.view.bounds.size.height - 200) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"TableViewCellID"];
    
    self.data = [[NSMutableArray alloc] init];
    
    [self query:nil];
}

- (NSManagedObjectModel *)managedObjectModel {
    if (!_managedObjectModel) {
        // 创建数据模型文件，类型为momd
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
        _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    }
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    if (!_persistentStoreCoordinator) {
        _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
        
        // 关联相关的sqlite文件，如果没有则创建一个新的
        NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true).lastObject;
        NSLog(@"path = %@", [docPath stringByAppendingPathComponent:@"blog.sqlite"]);
        NSURL *sqliteUrl = [NSURL fileURLWithPath:[docPath stringByAppendingPathComponent:@"blog.sqlite"]];
        [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqliteUrl options:nil error:nil];
    }
    return _persistentStoreCoordinator;
}

- (NSManagedObjectContext *)managedObjectContext {
    if (!_managedObjectContext) {
        // 创建上下文对象，ConcurrencyType主要有NSPrivateQueueConcurrencyType和NSMainQueueConcurrencyType
        // NSPrivateQueueConcurrencyType表示私有并发队列的类型，操作也是在子线程中完成
        // NSMainQueueConcurrencyType表示主并发队列类型，在UI上的操作，使用这个参数初始化
        _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        // 关联数据库连接器
        _managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator;
    }
    return _managedObjectContext;
}

- (void)saveContext {
    NSError *error = nil;
    if ([self.managedObjectContext hasChanges] && ![self.managedObjectContext save:&error]) {
        NSLog(@"saveContext error = %@", error.userInfo);
    } else {
        NSLog(@"saveContext success");
    }
}

- (void)query:(NSString *)name {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"StudentModel"];
    
    if (name.length > 0) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name = %@", name];
        request.predicate = predicate;
    }
    
    NSArray *data = [self.managedObjectContext executeFetchRequest:request error:nil];
    
    
    self.data = data;
    [self.tableView reloadData];
}

- (void)onInsertClick:(UIButton *)sender {
    StudentModel *student = [NSEntityDescription insertNewObjectForEntityForName:@"StudentModel" inManagedObjectContext:self.managedObjectContext];
    student.name = self.nameTextField.text;
    student.age = [self.ageTextField.text intValue];
    
    [self saveContext];

    [self query:nil];
}

- (void)onEditClick:(UIButton *)sender {
    if (self.currentModel) {
        self.currentModel.name = self.nameTextField.text;
        self.currentModel.age = [self.ageTextField.text intValue];
        
        [self saveContext];
        [self query:nil];
    }
}

- (void)onDeleteClick:(UIButton *)sender {
    if (self.currentModel) {
        [self.managedObjectContext deleteObject:self.currentModel];

        self.currentModel = nil;
        [self saveContext];
        [self query:nil];
    }
}

- (void)onQueryClick:(UIButton *)sender {
    [self query:self.nameTextField.text];
}


#pragma mark - UITableViewDataSource -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    StudentModel *model = self.data[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCellID" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%@-%d", model.name, model.age];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.currentModel = self.data[indexPath.row];
    self.nameTextField.text = self.currentModel.name;
    self.ageTextField.text = [NSString stringWithFormat:@"%d", self.currentModel.age];
}

@end
