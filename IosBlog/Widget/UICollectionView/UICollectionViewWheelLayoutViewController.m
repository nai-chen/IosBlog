//
//  UICollectionViewWheelLayoutViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/4/15.
//

#import "UICollectionViewWheelLayoutViewController.h"
#import "MyWheelLayout.h"

@interface UICollectionViewWheelLayoutViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation UICollectionViewWheelLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    MyWheelLayout *layout = [[MyWheelLayout alloc]init];
    UICollectionView *collectView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 320, 400) collectionViewLayout:layout];
    collectView.delegate = self;
    collectView.dataSource = self;
    [collectView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
    [self.view addSubview:collectView];
}
 
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 250, 80)];
    label.text = [NSString stringWithFormat:@"我是第%ld行",(long)indexPath.row];
    [cell.contentView addSubview:label];
    return cell;
}

@end
