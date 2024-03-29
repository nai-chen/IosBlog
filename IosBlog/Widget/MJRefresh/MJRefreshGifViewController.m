//
//  MJRefreshGifViewController.m
//  IosBlog
//
//  Created by PeterChen on 2022/1/14.
//

#import "MJRefreshGifViewController.h"

#import "MJRefresh.h"

@interface MJRefreshGifViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView* tableView;
@property(nonatomic, strong) NSMutableArray *data;

@end

@implementation MJRefreshGifViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.data = [[NSMutableArray alloc] init];
    for (int index = 1; index <= 15; index++) {
        [self.data addObject: [NSString stringWithFormat:@"%d", index]];
    }
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.view).offset(50);
    }];
    
    __weak typeof(self) weakSelf = self;
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf refresh];
        });
    }];
    
    [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [header setTitle:@"松开刷新" forState:MJRefreshStatePulling];
    [header setTitle:@"刷新中..." forState:MJRefreshStateRefreshing];
    
    header.lastUpdatedTimeLabel.hidden = YES;
    
    NSArray *idleImages = @[[UIImage imageNamed:@"btn_guanzhu"]];
    NSArray *pullingImages = @[[UIImage imageNamed:@"btn_guanzhu_s"]];
    NSArray *refreshingImages = @[[UIImage imageNamed:@"btn_guanzhu_s"],
                          [UIImage imageNamed:@"btn_guanzhu"]];
    
    [header setImages:idleImages forState:MJRefreshStateIdle];
    [header setImages:pullingImages forState:MJRefreshStatePulling];
    [header setImages:refreshingImages forState:MJRefreshStateRefreshing];

    self.tableView.mj_header = header;
    
    MJRefreshBackGifFooter *footer = [MJRefreshBackGifFooter footerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf loading];
        });
    }];
    [footer setTitle:@"上拉刷新" forState:MJRefreshStateIdle];
    [footer setTitle:@"松开刷新" forState:MJRefreshStatePulling];
    [footer setTitle:@"刷新中..." forState:MJRefreshStateRefreshing];
    
    [footer setImages:idleImages forState:MJRefreshStateIdle];
    [footer setImages:pullingImages forState:MJRefreshStatePulling];
    [footer setImages:refreshingImages forState:MJRefreshStateRefreshing];
    
    self.tableView.mj_footer = footer;
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

- (void)refresh {
    self.data = [[NSMutableArray alloc] init];
    for (int index = 1; index <= 15; index++) {
        [self.data addObject: [NSString stringWithFormat:@"%d", index]];
    }

    [self.tableView reloadData];
    
    //网络请求加载数据完成后在停止刷新
    [self.tableView.mj_header endRefreshing];
}

- (void)loading {
    for (int index = 1; index <= 15; index++) {
        [self.data addObject: [NSString stringWithFormat:@"%ld", [self.data count] + 1]];
    }

    [self.tableView reloadData];
    
    [self.tableView.mj_footer endRefreshing];
}

#pragma mark - UITableViewDataSource -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
    cell.textLabel.text = [self.data objectAtIndex:indexPath.row];
    return cell;
}

@end
