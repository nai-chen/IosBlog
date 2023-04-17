//
//  UITableViewPlainViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/12/29.
//

#import "UITableViewPlainViewController.h"

@interface UITableViewPlainViewController ()<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSMutableArray *data;

@end

@implementation UITableViewPlainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.data = [[NSMutableArray alloc] init];
    for (int index = 8; index < 15; index++) {
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
        [dict setObject:[NSString stringWithFormat:@"title - %d", index] forKey:@"title"];
        
        NSMutableArray *value = [[NSMutableArray alloc] init];
        for (int i = index; i < index*2; i++) {
            [value addObject: [NSString stringWithFormat:@"%d - %d", index, i]];
        }
        [dict setObject:value forKey:@"value"];
        
        [self.data addObject:dict];
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
        
        _tableView.sectionIndexColor = [UIColor blackColor];
        _tableView.sectionIndexBackgroundColor = [UIColor grayColor];

        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CellId"];
    }
    return _tableView;
}

#pragma mark - UITableViewDataSource -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.data count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *dict = self.data[section];
    NSArray *array = [dict objectForKey:@"value"];
    return [array count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSDictionary *dict = self.data[section];
    return [dict objectForKey:@"title"];
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return @[@"8", @"9", @"10", @"11", @"12", @"13", @"14"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];

    NSDictionary *dict = self.data[indexPath.section];
    NSArray *array = [dict objectForKey:@"value"];
    cell.textLabel.text = [array objectAtIndex:indexPath.row];

    return cell;
}

////去掉UItableview headerview黏性(sticky)
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    CGFloat sectionHeaderHeight = 30;
//    if (scrollView.contentOffset.y <= sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
//        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
//    } else if (scrollView.contentOffset.y >= sectionHeaderHeight) {
//        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
//    }
//}

@end
