//
//  NestedTabTableViewController.m
//  IosBlog
//
//  Created by PC010055 on 2023/4/13.
//

#import "NestedTabTableViewController.h"

#import "UKCustomTabItemView.h"
#import "UKNestedTableView.h"

@interface NestedTabTableViewController ()<UITableViewDelegate, UITableViewDataSource, UKTabViewDelegate>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) UKTabView *tabView;
@property(nonatomic, assign) NSInteger selection;
@property(nonatomic, assign) CGFloat tab1Offset;
@property(nonatomic, assign) CGFloat tab2Offset;

@end

@implementation NestedTabTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.selection = 0;
    self.tab1Offset = 0;
    self.tab2Offset = 0;
    
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

- (UKTabView *)tabView {
    if (!_tabView) {
        _tabView = [[UKTabView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 50)];
        [_tabView setIndicatorWidth:80 height:2 radius:1 color:[UIColor blueColor]];
        
        UKCustomTabItemView *tabItemView1 = [[UKCustomTabItemView alloc] init];
        [tabItemView1 setText:@"选项1"];
        [_tabView addItemView:tabItemView1];
        
        UKCustomTabItemView *tabItemView2 = [[UKCustomTabItemView alloc] init];
        [tabItemView2 setText:@"选项2"];
        [_tabView addItemView:tabItemView2];
        
        _tabView.delegate = self;
        
        [_tabView setSelection:0];
    }
    return _tabView;
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
        return self.tabView;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return 50;
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        cell.backgroundColor = [UIColor yellowColor];
        cell.textLabel.text = @"section 0";
    } else {
        if (indexPath.row % 2 == 0) {
            if (self.selection == 0) {
                cell.backgroundColor = [UIColor grayColor];
            } else {
                cell.backgroundColor = [UIColor darkGrayColor];
            }
        } else {
            cell.backgroundColor = [UIColor whiteColor];
        }
        cell.textLabel.text = [NSString stringWithFormat:@"item %ld - %ld", self.selection, indexPath.row];
    }
    
    return cell;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"scrollViewDidEndDragging");

    [self recordOffset:scrollView];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"scrollViewDidEndDecelerating");

    [self recordOffset:scrollView];
}

- (void)recordOffset:(UIScrollView *)scrollView {
    if (self.selection == 0) {
        self.tab1Offset = scrollView.contentOffset.y;
        NSLog(@"tab1Offset = %.2f", self.tab1Offset);
    } else if (self.selection == 1) {
        self.tab2Offset = scrollView.contentOffset.y;
        NSLog(@"tab2Offset = %.2f", self.tab2Offset);
    }
}

#pragma mark - UKTabViewDelegate -
- (void)onTabViewSelected:(UKTabView *)tabView position:(NSInteger)position {
    self.selection = position;

    [self.tableView reloadData];

    [self.tableView layoutIfNeeded];
    if (position == 0) {
        self.tab1Offset = [self getDestOffset:self.tab1Offset originOffset:self.tab2Offset];
        NSLog(@"onTabViewSelected tab1Offset = %.2f", self.tab1Offset);
        self.tableView.contentOffset = CGPointMake(0, self.tab1Offset);
    } else if (position == 1) {
        self.tab2Offset = [self getDestOffset:self.tab2Offset originOffset:self.tab1Offset];
        NSLog(@"onTabViewSelected tab2Offset = %.2f", self.tab2Offset);
        self.tableView.contentOffset = CGPointMake(0, self.tab2Offset);
    }
}

- (CGFloat)getDestOffset:(CGFloat)destOffset originOffset:(CGFloat)originOffset {
    if (originOffset >= 150) {
        if (destOffset >= 150) {
            return destOffset;
        } else {
            return 150;
        }
    } else {
        return originOffset;
    }
}

@end
