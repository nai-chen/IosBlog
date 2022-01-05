//
//  UITableViewEditViewController.m
//  IosBlog
//
//  Created by PeterChen on 2022/1/4.
//

#import "UITableViewEditViewController.h"

#import "Masonry.h"

@interface UITableViewEditViewController ()<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) UIBarButtonItem *rightButton;
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSMutableArray *data;

@property(nonatomic, assign) BOOL editing;

@end

@implementation UITableViewEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.data = [[NSMutableArray alloc] init];
    for (int index = 0; index < 10; index++) {
        [self.data addObject:[NSString stringWithFormat:@"data%d", index]];
    }
    
    self.rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(onRightButtonClick:)];
    [self.navigationItem setRightBarButtonItem:self.rightButton animated:NO];
    self.editing = NO;
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.view).offset(50);
    }];
}

- (void)onRightButtonClick:(UIBarButtonItem *)item {
    self.editing = !self.editing;
//    self.tableView.editing = self.editing;
    [self.tableView setEditing:self.editing animated:YES];
    
    if (self.editing) {
        [self.rightButton setTitle:@"Normal"];
    } else {
        [self.rightButton setTitle:@"Edit"];
    }
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];

        _tableView.delegate = self;
        _tableView.dataSource = self;

        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CellId"];
    }
    return _tableView;
}

#pragma mark - UITableViewDataSource -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
    cell.textLabel.text = self.data[indexPath.row];

    return cell;
}

#pragma mark - UITableViewDelegate -
// 自定义删除按钮
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删个除";
}

// 定义编辑操作
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSLog(@"delete");
        [tableView beginUpdates];

        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
        [self.data removeObjectAtIndex:indexPath.row];
        
        [tableView endUpdates];
    }
}

@end
