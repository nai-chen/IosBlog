//
//  CoreDataViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/5/19.
//

#import "CoreDataViewController.h"
#import "Staff+CoreDataProperties.h"

#import "DemoTableViewCell.h"
#import "Masonry.h"

@interface CoreDataViewController () <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) NSManagedObjectModel *model;
@property(nonatomic, strong) NSPersistentStoreCoordinator *coordinator;
@property(nonatomic, strong) NSManagedObjectContext *context;

@property(nonatomic, strong) Staff *selectStaff;

@property(nonatomic, strong) UITextField *nameTextField;
@property(nonatomic, strong) UITextField *ageTextField;
@property(nonatomic, strong) UITextField *sexTextField;

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSArray *array;

@end

@implementation CoreDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 100, 60, 40)];
    nameLabel.text = @"name:";
    nameLabel.textColor = [UIColor blackColor];
    [self.view addSubview:nameLabel];
    
    self.nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(85, 105, 200, 30)];
    self.nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.nameTextField.placeholder = @"please input name";
    [self.view addSubview: self.nameTextField];
    
    UILabel *ageLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 140, 60, 40)];
    ageLabel.text = @"age:";
    ageLabel.textColor = [UIColor blackColor];
    [self.view addSubview:ageLabel];
    
    self.ageTextField = [[UITextField alloc] initWithFrame:CGRectMake(85, 145, 200, 30)];
    self.ageTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.ageTextField.placeholder = @"please input age";
    self.ageTextField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    [self.view addSubview: self.ageTextField];
    
    UILabel *sexLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 180, 60, 40)];
    sexLabel.text = @"sex:";
    sexLabel.textColor = [UIColor blackColor];
    [self.view addSubview:sexLabel];
    
    self.sexTextField = [[UITextField alloc] initWithFrame:CGRectMake(85, 185, 200, 30)];
    self.sexTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.sexTextField.placeholder = @"please input sex";
    [self.view addSubview: self.sexTextField];
    
    UIButton *insertButton = [[UIButton alloc] initWithFrame: CGRectMake(25, 250, 60, 30)];
    [insertButton setTitle:@"insert" forState:UIControlStateNormal];
    [insertButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview: insertButton];
    [insertButton addTarget:self action:@selector(insertModel) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *updateButton = [[UIButton alloc] initWithFrame: CGRectMake(85, 250, 60, 30)];
    [updateButton setTitle:@"update" forState:UIControlStateNormal];
    [updateButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview: updateButton];
    [updateButton addTarget:self action:@selector(updateModel) forControlEvents:UIControlEventTouchUpInside];

    UIButton *deleteButton = [[UIButton alloc] initWithFrame: CGRectMake(145, 250, 60, 30)];
    [deleteButton setTitle:@"delete" forState:UIControlStateNormal];
    [deleteButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview: deleteButton];
    [deleteButton addTarget:self action:@selector(deleteModel) forControlEvents:UIControlEventTouchUpInside];
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[DemoTableViewCell class] forCellReuseIdentifier:@"DemoTableViewCellId"];
    [self.view addSubview: self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(insertButton).offset(30);
    }];

    // 创建托管对象模型
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
    self.model = [[NSManagedObjectModel alloc] initWithContentsOfURL: url];
    
    // 创建持久化存储调度器
    self.coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: self.model];

    // 创建并关联SQLite数据库文件，如果已经存在则不会重复创建
    NSString *dataPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    dataPath = [dataPath stringByAppendingPathComponent:@"Company.sqlite"];
    [self.coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:[NSURL fileURLWithPath:dataPath] options:nil error:nil];

    // 创建上下文对象，并发队列设置为主队列
    self.context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    self.context.persistentStoreCoordinator = self.coordinator;
    
    self.array = [self queryModel];
    [self.tableView reloadData];
}

- (NSArray *)queryModel {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Staff"];
    
    NSArray *array = [self.context executeFetchRequest:request error:nil];
    NSLog(@"queryModel count = %ld", array.count);
    return array;
}

- (void)insertModel {
    NSString *name = self.nameTextField.text;
    int64_t age = [self.ageTextField.text intValue];
    NSString *sex = self.sexTextField.text;

    if (name.length > 0 && age > 0 && sex.length > 0) {
        Staff *staff = [NSEntityDescription insertNewObjectForEntityForName:@"Staff" inManagedObjectContext:_context];
        staff.name = name;
        staff.age = age;
        staff.sex = sex;
        
        NSError *error = nil;
        if ([self.context save:&error]) {
            NSLog(@"insert success");
            
            self.selectStaff = staff;
            self.array = [self queryModel];
            [self.tableView reloadData];
        } else {
            NSLog(@"%@", error.description);
        }
    }
}

- (void)deleteModel {
    if (self.selectStaff) {
        [self.context deleteObject: self.selectStaff];
        
        NSError *error = nil;
        if ([self.context save:&error]) {
            NSLog(@"delete success");
            
            self.array = [self queryModel];
            [self.tableView reloadData];
        } else {
            NSLog(@"%@", error.description);
        }
        self.selectStaff = nil;
        self.nameTextField.text = @"";
        self.ageTextField.text = @"";
        self.sexTextField.text = @"";
    }
}

- (void)updateModel {
    NSString *name = self.nameTextField.text;
    int64_t age = [self.ageTextField.text intValue];
    NSString *sex = self.sexTextField.text;

    if (name.length > 0 && age > 0 && sex.length > 0 && self.selectStaff) {
        self.selectStaff.name = name;
        self.selectStaff.age = age;
        self.selectStaff.sex = sex;
        
        NSError *error = nil;
        if ([self.context save:&error]) {
            NSLog(@"update success");
            
            self.array = [self queryModel];
            [self.tableView reloadData];
        } else {
            NSLog(@"%@", error.description);
        }
    }
}

#pragma mark - UITableView -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DemoTableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:@"DemoTableViewCellId" forIndexPath:indexPath];
    
    Staff *staff = self.array[indexPath.row];
    [tableViewCell setTitle: [NSString stringWithFormat:@"%@-%lld-%@", staff.name, staff.age, staff.sex]];
    
    return tableViewCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 52;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectStaff = self.array[indexPath.row];
    
    self.nameTextField.text = self.selectStaff.name;
    self.ageTextField.text = [NSString stringWithFormat:@"%lld", self.selectStaff.age];
    self.sexTextField.text = self.selectStaff.sex;
}
@end
