//
//  UKNestedScrollView.m
//  IosBlog
//
//  Created by PC010055 on 2023/4/14.
//

#import "UKNestedScrollView.h"

#import "UKNestedTableView.h"

@interface UKNestedScrollView () <UITableViewDataSource, UITableViewDelegate, UKTabViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate>

@property(nonatomic, strong) UKNestedTableView *tableView;
@property(nonatomic, strong) UIView *sectionHeaderView;
@property(nonatomic, strong) UKTabView *tabView;
@property(nonatomic, strong) UICollectionView *collectionView;

@property(nonatomic, strong) NSMutableArray <UITableView *> *contentViewArray;
@property(nonatomic, strong) NSMutableArray <NSNumber *> *offsetArray;
@property(nonatomic, assign) BOOL dragging;
@property(nonatomic, assign) CGFloat headerHeight;
@property(nonatomic, assign) CGFloat originOffset;
@property(nonatomic, assign) CGFloat offset;
@property(nonatomic, assign) BOOL changed;
@property(nonatomic, assign) BOOL top;

@end

@implementation UKNestedScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupInitialUI];
    }
    return self;
}

- (void)setHeaderView:(UIView *)headerView {
    self.tableView.tableHeaderView = headerView;
    self.headerHeight = headerView.frame.size.height;
}

- (void)addTabView:(UKTabItemView *)itemView contentView:(UITableView *)contentView {
    [self.tabView addItemView:itemView];
    
    [self.contentViewArray addObject:contentView];
    [self.offsetArray addObject:[NSNumber numberWithFloat:0]];
    
    [self.collectionView reloadData];
}

- (void)setSelection:(NSInteger)selection {
    [self.tabView setSelection:selection];
    [self collectionViewScrollToPosition:selection];
}

- (void)collectionViewScrollToPosition:(NSInteger)position {
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:position inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
}

- (void)setupInitialUI {
    self.contentViewArray = [[NSMutableArray alloc] init];
    self.offsetArray = [[NSMutableArray alloc] init];
    
    [self addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self);
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

- (UIView *)sectionHeaderView {
    if (!_sectionHeaderView) {
        _sectionHeaderView = [[UIView alloc] initWithFrame:self.frame];
        
        [_sectionHeaderView addSubview:self.tabView];
        
        [_sectionHeaderView addSubview:self.collectionView];
    }
    return _sectionHeaderView;
}

- (UKTabView *)tabView {
    if (!_tabView) {
        _tabView = [[UKTabView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 50)];
        [_tabView setIndicatorWidth:80 height:2 radius:1 color:[UIColor blueColor]];

        _tabView.delegate = self;
    }
    return _tabView;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = CGSizeMake(self.frame.size.width, self.frame.size.height - 50);
        layout.minimumLineSpacing = CGFLOAT_MIN;
        layout.minimumInteritemSpacing = CGFLOAT_MIN;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 50, self.frame.size.width, self.frame.size.height - 50) collectionViewLayout:layout];
        _collectionView.pagingEnabled = YES;
        _collectionView.bounces = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
//        _collectionView.scrollEnabled = NO;

        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"CellId"];
    }
    return _collectionView;
}

#pragma mark - UITableViewDataSource -
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return self.frame.size.height;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return self.sectionHeaderView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[UITableViewCell alloc] init];
}

#pragma mark - UICollectionViewDataSource -
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.contentViewArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellId" forIndexPath:indexPath];
    
    UITableView *contentView = self.contentViewArray[indexPath.row];
    [contentView removeFromSuperview];
    
    [cell.contentView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(cell.contentView);
    }];
    
    return cell;
}


#pragma mark - UIScrollViewDelegate -
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (scrollView == self.collectionView) {
        self.dragging = YES;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.collectionView) {
        if (self.dragging) {
            CGFloat width = scrollView.contentOffset.x;
            NSInteger page = width/self.frame.size.width + 0.5;
//            NSLog(@"page scrollViewDidScroll = %ld %f", page, width/self.frame.size.width - page);
            
            [self.tabView setSelection:page offsetRatio:(width/self.frame.size.width - page)];
        }
    } else if (scrollView == self.tableView) {
        NSLog(@"scrollViewDidScroll tableView.contentOffset.y = %f", self.tableView.contentOffset.y);
        self.originOffset = self.offset;
        self.offset = self.tableView.contentOffset.y;
        self.changed = YES;
    } else {
        NSInteger position = 0;
        for (UIScrollView *contentView in self.contentViewArray) {
            if (contentView == scrollView) {
                // 如果外面列表滑动，禁止里面列表滑动事件
                if (self.changed) {
                    scrollView.contentOffset = CGPointMake(0, [self.offsetArray[position] floatValue]);
                    self.changed = NO;
                } else {
                    // 记录当前页面偏移量，方便后面禁止事件
                    self.offsetArray[position] = [NSNumber numberWithFloat:scrollView.contentOffset.y];
                }
//                CGFloat scrollViewOffset = scrollView.contentOffset.y - [self.offsetArray[position] floatValue];
//
//                if (scrollViewOffset > 0) {
//                    if (self.changed) {
//                        scrollView.contentOffset = CGPointMake(0, [self.offsetArray[position] floatValue]);
//                        self.changed = NO;
//                    } else {
//                        self.offsetArray[position] = [NSNumber numberWithFloat:scrollView.contentOffset.y];
//                    }
//                } else if (scrollViewOffset < 0) {
//                    if (self.changed) {
//                        NSLog(@"scrollViewDidScroll scrollView.offset = %f offset = %f", self.offset, self.originOffset);
//                        self.offset = self.originOffset;
//
//                        self.tableView.delegate = nil;
//                        self.tableView.contentOffset = CGPointMake(0, self.offset);
//                        self.tableView.delegate = self;
//
//                        self.changed = NO;
//                    }
//                    self.offsetArray[position] = [NSNumber numberWithFloat:scrollView.contentOffset.y];
//                }
            
                break;
            }
            position++;
        }
    }

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == self.collectionView) {
        CGFloat width = scrollView.contentOffset.x;
        NSInteger page = width/self.frame.size.width + 0.5;

//        NSLog(@"page scrollViewDidEndDecelerating = %.2f %ld", width, page);
        [self.tabView setSelection:page];
        self.dragging = NO;
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (scrollView == self.collectionView && !decelerate) {
        CGFloat width = scrollView.contentOffset.x;
        NSInteger page = width/self.frame.size.width + 0.5;

//        NSLog(@"page scrollViewDidEndDragging = %.2f %ld", width, page);
        [self.tabView setSelection:page];
        self.dragging = NO;
    }
}
 
#pragma mark - UKTabViewDelegate -
- (void)onTabViewSelected:(UKTabView *)tabView position:(NSInteger)position {
    [self collectionViewScrollToPosition:position];
}

@end
