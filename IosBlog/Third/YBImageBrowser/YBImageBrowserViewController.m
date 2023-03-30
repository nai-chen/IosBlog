//
//  YBImageBrowserViewController.m
//  IosBlog
//
//  Created by PC010055 on 2023/3/30.
//

#import "YBImageBrowserViewController.h"

#import "ImageBrowserCollectionViewCell.h"
#import "YBImageBrowser.h"
#import "YBIBVideoData.h"

@interface YBImageBrowserViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property(nonatomic, strong) UICollectionView *collectionView;

@end

@implementation YBImageBrowserViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //创建一个layout布局类
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    //设置布局方向为垂直流布局
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //设置每个item的大小为120*120
    layout.itemSize = CGSizeMake(120, 120);

    //创建collectionView 通过一个布局策略layout来创建
    UICollectionView *collectView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout];
    //代理设置
    collectView.delegate = self;
    collectView.dataSource = self;
    //注册item类型 这里使用系统的类型
    [collectView registerClass:[ImageBrowserCollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
   
    [self.view addSubview:collectView];
}

#pragma mark - UICollectionViewDataSource -
//返回分区个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
//返回每个分区的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}

//返回每个item
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ImageBrowserCollectionViewCell *cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        [cell setImage:[UIImage imageNamed:@"bg"]];
    } else if (indexPath.row == 1) {
        [cell setImage:[UIImage imageNamed:@"long_pic"]];
    } else if (indexPath.row == 2) {
        [cell setImageUrl:@"https://img-blog.csdnimg.cn/f9ade7ef9d434f0bb6389471f1cf801d.png"];
    } else if (indexPath.row == 3) {
        [cell setImageUrl:@"https://img-blog.csdnimg.cn/20210413155943455.gif"];
    } else if (indexPath.row == 4) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"image_1" withExtension:@"jpg"];
        [cell setImageNSUrl:url];
    } else if (indexPath.row == 5) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"image_2" withExtension:@"jpg"];
        [cell setImageNSUrl:url];
    }
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    ImageBrowserCollectionViewCell *cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    YBImageBrowser *imageBrowser = [[YBImageBrowser alloc] init];
 
    if (indexPath.row == 0) {
        YBIBImageData *imageData = [[YBIBImageData alloc] init];
        imageData.image = ^UIImage * _Nullable{
            return [UIImage imageNamed:@"bg"];
        };
        
        imageData.projectiveView = cell.imageView;
        imageData.allowSaveToPhotoAlbum = NO;
        imageBrowser.dataSourceArray = @[imageData];
    } else if (indexPath.row == 1) {
        YBIBImageData *imageData = [[YBIBImageData alloc] init];
        imageData.image = ^UIImage * _Nullable{
            return [UIImage imageNamed:@"long_pic"];
        };
        imageData.defaultLayout.verticalFillType = YBIBImageFillTypeFullWidth;
        imageBrowser.dataSourceArray = @[imageData];
    } else if (indexPath.row == 2) {
        YBIBImageData *imageData = [[YBIBImageData alloc] init];
        imageData.imageURL = [NSURL URLWithString:@"https://img-blog.csdnimg.cn/f9ade7ef9d434f0bb6389471f1cf801d.png"];

        imageBrowser.dataSourceArray = @[imageData];
    } else if (indexPath.row == 3) {
        YBIBImageData *imageData = [[YBIBImageData alloc] init];
        imageData.imageURL = [NSURL URLWithString:@"https://img-blog.csdnimg.cn/20210413155943455.gif"];

        imageBrowser.dataSourceArray = @[imageData];
    } else if (indexPath.row == 4) {
        YBIBImageData *imageData1 = [[YBIBImageData alloc] init];
        imageData1.image = ^UIImage * _Nullable{
            return [UIImage imageNamed:@"bg"];
        };
        
        YBIBImageData *imageData2 = [[YBIBImageData alloc] init];
        imageData2.image = ^UIImage * _Nullable{
            return [UIImage imageNamed:@"long_pic"];
        };
        imageData2.defaultLayout.verticalFillType = YBIBImageFillTypeFullWidth;

        YBIBImageData *imageData3 = [[YBIBImageData alloc] init];
        imageData3.imageURL = [NSURL URLWithString:@"https://img-blog.csdnimg.cn/f9ade7ef9d434f0bb6389471f1cf801d.png"];

        YBIBImageData *imageData4 = [[YBIBImageData alloc] init];
        imageData4.imageURL = [NSURL URLWithString:@"https://img-blog.csdnimg.cn/20210413155943455.gif"];
        
        YBIBImageData *imageData5 = [[YBIBImageData alloc] init];
        imageData5.imageURL = [[NSBundle mainBundle] URLForResource:@"image_1" withExtension:@"jpg"];

        imageBrowser.dataSourceArray = @[imageData1, imageData2, imageData3, imageData4, imageData5];
        imageBrowser.currentPage = 4;
    } else if (indexPath.row == 5) {
        YBIBVideoData *videoData = [[YBIBVideoData alloc] init];
        videoData.videoURL = [NSURL URLWithString:@"http://1256052496.vod2.myqcloud.com/d997cef1vodsh1256052496/fde51b70243791580011948733/uwzOm25FUboA.mp4"];
        
        imageBrowser.dataSourceArray = @[videoData];
    }
    
    [imageBrowser show];
}

@end
