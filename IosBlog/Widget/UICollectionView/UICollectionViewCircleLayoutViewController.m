//
//  UICollectionViewCircleLayoutViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/4/15.
//

#import "UICollectionViewCircleLayoutViewController.h"
#import "MyCircleLayout.h"

@interface UICollectionViewCircleLayoutViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation UICollectionViewCircleLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
    MyCircleLayout *layout = [[MyCircleLayout alloc]init];
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
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = 25;
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    return cell;
}

@end
