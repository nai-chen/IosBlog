//
//  UKCalendarView.m
//  IosBlog
//
//  Created by PC010055 on 2023/4/21.
//

#import "UKCalendarView.h"

#import "UKCalendarCollectionViewCell.h"

@interface UKCalendarView () <UICollectionViewDataSource, UICollectionViewDelegate>

@property(nonatomic, strong) UIImageView *lastMonthImageView;
@property(nonatomic, strong) UILabel *monthLabel;
@property(nonatomic, strong) UIImageView *nextMonthImageView;
@property(nonatomic, strong) UICollectionView *collectionView;

@property(nonatomic, strong) NSCalendar *calendar;
@property(nonatomic, assign) NSInteger calendarUnits;
@property(nonatomic, strong) NSDateComponents *currentDateComponents;
@property(nonatomic, strong) NSDateFormatter *dateFormat;

@property(nonatomic, strong) NSMutableArray *dateArray;

@property(nonatomic, strong) NSString *todayDay;

@end

@implementation UKCalendarView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        self.calendarUnits = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
        
        NSDate *todayDate = [NSDate date];
        self.currentDateComponents = [self.calendar components:self.calendarUnits fromDate:todayDate];
        self.currentDateComponents.day = 1;
        self.currentDateComponents.hour = 0;
        self.currentDateComponents.minute = 0;
        self.currentDateComponents.second = 0;
        
        self.dateFormat = [[NSDateFormatter alloc] init];
        [self.dateFormat setDateFormat:@"yyyy-MM-dd"];
        self.todayDay = [self.dateFormat stringFromDate:todayDate];
        
        self.dateArray = [[NSMutableArray alloc] init];
        
        [self setupInitialUI];
    }
    return self;
}

- (void)setupInitialUI {
    self.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.lastMonthImageView];
    [self.lastMonthImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(5);
        make.top.equalTo(self);
        make.width.height.equalTo(@50);
    }];
    
    [self addSubview:self.nextMonthImageView];
    [self.nextMonthImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-5);
        make.top.equalTo(self);
        make.width.height.equalTo(@50);
    }];
    
    [self addSubview:self.monthLabel];
    [self.monthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self);
        make.height.equalTo(@50);
    }];
    
    CGFloat itemWidth = self.frame.size.width / 7.0;
    NSArray *titleArray = @[@"Sun", @"Mon", @"Tue", @"Wed", @"Thu", @"Fri", @"Sat"];
    for (NSInteger index = 0; index < 7; index++) {
        UILabel *titleLabel = [self makeTitleLabel:titleArray[index]];
        [self addSubview:titleLabel];
        
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(itemWidth * index);
            make.width.equalTo(@(itemWidth));
            make.top.equalTo(self).offset(50);
            make.height.equalTo(@20);
        }];
    }
    
    [self addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self).offset(74);
        make.bottom.equalTo(self);
    }];
    
    [self moveToMonth];
}

- (void)moveToMonth {
    NSDate *firstDayDate = [self.calendar dateFromComponents:self.currentDateComponents];

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"LLLL yyyy"];
    self.monthLabel.text = [dateFormatter stringFromDate:firstDayDate];

    NSDateComponents *calcDateComponents = [self.calendar components:self.calendarUnits fromDate:firstDayDate];
    NSUInteger firstDayOfWeek = [self.calendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:firstDayDate];
    [self.dateArray removeAllObjects];

    if (firstDayOfWeek > 1) {
        calcDateComponents.month--;
        
        NSDate *lastDayDate = [NSDate dateWithTimeInterval:(-24*60*60) sinceDate:firstDayDate];
        NSInteger lastDayOfLastMonth = [self.calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:lastDayDate].length;

        // 29 30 31 1 2 3 4
        // firstDayOfWeek = 4
        // lastDayOfLastMonth = 31
        // index = 1, 31 - (4 - 1) + 1
        for (NSInteger index = 1; index < firstDayOfWeek; index++) {
            UKCalendarDate *lastMonthDate = [[UKCalendarDate alloc] init];
            lastMonthDate.day = lastDayOfLastMonth - (firstDayOfWeek - index - 1);
            lastMonthDate.dayStyle = UKCalendarDateDayStyle_Last_Month;
            
            [self.dateArray addObject:lastMonthDate];
        }
    }
    
    // 重置
    calcDateComponents.month = self.currentDateComponents.month;
    
    NSInteger lastDayOfCurrentMonth = [self.calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:firstDayDate].length;
    for (NSInteger day = 1; day <= lastDayOfCurrentMonth; day++) {
        UKCalendarDate *currentMonthDate = [[UKCalendarDate alloc] init];
        currentMonthDate.day = day;
        currentMonthDate.dayStyle = UKCalendarDateDayStyle_Current_Month;
        
        calcDateComponents.day = day;
        NSString *day = [self.dateFormat stringFromDate:[self.calendar dateFromComponents:calcDateComponents]];
        if ([day isEqualToString:self.todayDay]) {
            currentMonthDate.eventStyle = UKCalendarDateEventStyle_Today;
        }

        [self.dateArray addObject:currentMonthDate];
    }
    
    calcDateComponents.month++;
    NSInteger len = 42 - self.dateArray.count;
    for (NSInteger day = 1; day <= len; day++) {
        UKCalendarDate *nextMonthDate = [[UKCalendarDate alloc] init];
        nextMonthDate.day = day;
        nextMonthDate.dayStyle = UKCalendarDateDayStyle_Next_Month;
        
        [self.dateArray addObject:nextMonthDate];
    }
    [self.collectionView reloadData];
}


- (UIImageView *)lastMonthImageView {
    if (!_lastMonthImageView) {
        _lastMonthImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"rl_left"]];
        _lastMonthImageView.contentMode = UIViewContentModeCenter;
        
        _lastMonthImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onLastMonthAction:)];
        [_lastMonthImageView addGestureRecognizer:recognizer];
    }
    return _lastMonthImageView;
}

- (void)onLastMonthAction:(UIGestureRecognizer *)recognizer {
    NSLog(@"last month");
    self.currentDateComponents.month--;
    [self moveToMonth];
}

- (UIImageView *)nextMonthImageView {
    if (!_nextMonthImageView) {
        _nextMonthImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"rl_right"]];
        _nextMonthImageView.contentMode = UIViewContentModeCenter;
        
        _nextMonthImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onNextMonthAction:)];
        [_nextMonthImageView addGestureRecognizer:recognizer];
    }
    return _nextMonthImageView;
}

- (void)onNextMonthAction:(UIGestureRecognizer *)recognizer {
    NSLog(@"next month");
    
    self.currentDateComponents.month++;
    [self moveToMonth];
}

- (UILabel *)monthLabel {
    if (!_monthLabel) {
        _monthLabel = [[UILabel alloc] init];
        _monthLabel.textColor = [UIColor blackColor];
        [_monthLabel setFont:[UIFont boldSystemFontOfSize:16]];
        
        _monthLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _monthLabel;
}

- (UILabel *)makeTitleLabel:(NSString *)title {
    UILabel *label = [[UILabel alloc] init];
    label.text = title;
    label.textColor = [UIColor darkGrayColor];
    [label setFont:[UIFont systemFontOfSize:13]];
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.itemSize = CGSizeMake(self.frame.size.width/7.0, (self.frame.size.height- 74) / 6.0);
        layout.minimumLineSpacing = CGFLOAT_MIN;
        layout.minimumInteritemSpacing = CGFLOAT_MIN;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        
        _collectionView.bounces = NO;
        
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
        [_collectionView registerClass:[UKCalendarCollectionViewCell class]
            forCellWithReuseIdentifier:@"CellId"];
    }
    return _collectionView;
}

#pragma mark - UICollectionViewDataSource -
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dateArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UKCalendarCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellId" forIndexPath:indexPath];
    
    UKCalendarDate *date = self.dateArray[indexPath.row];
    [cell setCalendarDate:date];
    return cell;
}

@end
