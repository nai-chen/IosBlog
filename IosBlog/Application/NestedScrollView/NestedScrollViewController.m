//
//  NestedScrollViewController.m
//  IosBlog
//
//  Created by PC010055 on 2023/4/12.
//

#import "NestedScrollViewController.h"

#import "UKNestedScrollView.h"
#import "UKCustomTabItemView.h"
#import "UKNestedTableView.h"

@interface NestedScrollViewController () <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) UKNestedScrollView *nestedScrollView;

@property(nonatomic, strong) UITableView *content1TableView;
@property(nonatomic, strong) UITableView *content2TableView;

@property(nonatomic, assign) NSInteger selection;
@property(nonatomic, assign) CGFloat scrollViewHeight;

@end

@implementation NestedScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.selection = 0;
    self.scrollViewHeight = kScreenHeight - kStatusBarHeight - 50 - kBottomSafeHeight;
    
    [self.view addSubview:self.nestedScrollView];
    [self.nestedScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(kStatusBarHeight + 50);
        make.height.equalTo(@(self.scrollViewHeight));
    }];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 150)];
    headerView.backgroundColor = [UIColor yellowColor];
    
    [self.nestedScrollView setHeaderView:headerView];
    
    UKCustomTabItemView *tabItemView1 = [[UKCustomTabItemView alloc] init];
    [tabItemView1 setText:@"选项1"];
    [self.nestedScrollView addTabView:tabItemView1 contentView:self.content1TableView];
    
    UKCustomTabItemView *tabItemView2 = [[UKCustomTabItemView alloc] init];
    [tabItemView2 setText:@"选项2"];
    [self.nestedScrollView addTabView:tabItemView2 contentView:self.content2TableView];
    
    [self.nestedScrollView setSelection:1];
}

- (UKNestedScrollView *)nestedScrollView {
    if (!_nestedScrollView) {
        _nestedScrollView = [[UKNestedScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, self.scrollViewHeight)];
    }
    return _nestedScrollView;
}

- (UITableView *)content1TableView {
    if (!_content1TableView) {
        _content1TableView = [self createTableView];
        _content1TableView.tag = 1;
        
        _content1TableView.delegate = self;
        _content1TableView.dataSource = self;
        
        [_content1TableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CellId"];
    }
    return _content1TableView;
}

- (UITableView *)content2TableView {
    if (!_content2TableView) {
        _content2TableView = [self createTableView];
        _content2TableView.tag = 1;
        
        _content2TableView.delegate = self;
        _content2TableView.dataSource = self;
        
        [_content2TableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CellId"];
    }
    return _content2TableView;
}

- (UITableView *)createTableView {
    UITableView *tableView = [[UKNestedTableView alloc] init];
        
    tableView.bounces = NO;
    tableView.showsVerticalScrollIndicator = NO;

    return tableView;
}

#pragma mark - UITableViewDataSource -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
    if (indexPath.row % 2 == 0) {
        cell.backgroundColor = [UIColor grayColor];
    } else {
        cell.backgroundColor = [UIColor whiteColor];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"item %ld - %ld", tableView.tag, indexPath.row];
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.nestedScrollView scrollViewDidScroll:scrollView];
}

@end
