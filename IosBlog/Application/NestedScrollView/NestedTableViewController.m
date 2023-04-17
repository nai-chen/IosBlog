//
//  NestedTableViewController.m
//  IosBlog
//
//  Created by PC010055 on 2023/4/13.
//

#import "NestedTableViewController.h"
#import "UKCustomTabItemView.h"
#import "UKNestedTableView.h"

@interface NestedTableViewController () <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;

@end

@implementation NestedTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(kStatusBarHeight + self.navigationController.navigationBar.frame.size.height);
        make.bottom.equalTo(self.view).offset(-kBottomSafeHeight);
        make.left.right.equalTo(self.view);
    }];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UKNestedTableView alloc] init];
        
        _tableView.bounces = NO;
        _tableView.showsVerticalScrollIndicator = NO;

        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CellId"];
    }
    return _tableView;
}

#pragma mark - UITableViewDataSource -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 150;
    }
    return 60;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 50)];
        headerView.backgroundColor = [UIColor blueColor];
        return headerView;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return 50;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        cell.backgroundColor = [UIColor yellowColor];
        cell.textLabel.text = @"section 0";
    } else {
        if (indexPath.row % 2 == 0) {
            cell.backgroundColor = [UIColor grayColor];
        } else {
            cell.backgroundColor = [UIColor whiteColor];
        }
        cell.textLabel.text = [NSString stringWithFormat:@"item - %ld", indexPath.row];
    }
    
    return cell;
}

@end
