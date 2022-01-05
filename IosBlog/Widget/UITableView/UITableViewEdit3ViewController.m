//
//  UITableViewEdit3ViewController.m
//  IosBlog
//
//  Created by PeterChen on 2022/1/4.
//

#import "UITableViewEdit3ViewController.h"

#import "Masonry.h"

@interface UITableViewEdit3ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) UIBarButtonItem *rightButton;
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSMutableArray *data;
@property(nonatomic, strong) NSMutableArray *remark;

@end

@implementation UITableViewEdit3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.data = [[NSMutableArray alloc] init];
    self.remark = [[NSMutableArray alloc] init];
    for (int index = 0; index < 10; index++) {
        [self.data addObject:[NSString stringWithFormat:@"data%d", index]];
        [self.remark addObject:@""];
    }
        
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.view).offset(50);
    }];
    
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
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"CellId"];
    cell.textLabel.text = self.data[indexPath.row];
    cell.detailTextLabel.text = self.remark[indexPath.row];

    return cell;
}

#pragma mark - UITableViewDelegate -
// 设置自定义按钮
- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive
            title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        [tableView beginUpdates];

        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
        [self.data removeObjectAtIndex:indexPath.row];
        [self.remark removeObjectAtIndex:indexPath.row];
        
        [tableView endUpdates];
    }];
    
    UITableViewRowAction *remarkAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal
            title:@"关注" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        [self.remark replaceObjectAtIndex:indexPath.row withObject:@"remark"];
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }];
    
    UITableViewRowAction *addAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal
            title:@"添加" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        [tableView beginUpdates];

        NSString* text = [NSString stringWithFormat:@"data%ld", [self.data count]];
        NSIndexPath *insertIndexPath = [NSIndexPath indexPathForRow:(indexPath.row+1) inSection:indexPath.section];
        
        [self.data insertObject:text atIndex:insertIndexPath.row];

        [tableView insertRowsAtIndexPaths:@[insertIndexPath] withRowAnimation:UITableViewRowAnimationTop];
        [tableView endUpdates];
    }];
    addAction.backgroundColor = [UIColor blueColor];
    
    return @[deleteAction, remarkAction, addAction];
}

@end
