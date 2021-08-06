//
//  MyWheelLayout.m
//  IosBlog
//
//  Created by PeterChen on 2021/4/15.
//

#import "MyWheelLayout.h"

@implementation MyWheelLayout

- (NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *attributes = [[NSMutableArray alloc]init];
    //遍历设置每个item的布局属性
    for (int i = 0; i < [self.collectionView numberOfItemsInSection:0]; i++) {
        [attributes addObject:[self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]]];
    }
    return attributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    //创建一个item布局属性类
    UICollectionViewLayoutAttributes *atti = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    //获取item的个数
    int itemCounts = (int)[self.collectionView numberOfItemsInSection:0];
    //设置每个item的大小为260*100
    atti.size = CGSizeMake(260, 100);
   /*
   后边介绍的代码添加在这里
   
   */
    atti.center = CGPointMake(self.collectionView.frame.size.width/2, self.collectionView.frame.size.height/2);
    //创建一个transform3D类
    //CATransform3D是一个类似矩阵的结构体
    //CATransform3DIdentity创建空得矩阵
    CATransform3D trans3D = CATransform3DIdentity;
    //这个值设置的是透视度，影响视觉离投影平面的距离
    trans3D.m34 = -1/900.0;
    //下面这些属性 后面会具体介绍
    //这个是3D滚轮的半径
    CGFloat radius = 50/tanf(M_PI*2/itemCounts/2);
    //计算每个item应该旋转的角度
//    CGFloat angle = (float)(indexPath.row)/itemCounts*M_PI*2;
    
    //获取当前的偏移量
    float offset = self.collectionView.contentOffset.y;
    //在角度设置上，添加一个偏移角度
    float angleOffset = offset/self.collectionView.frame.size.height;
    CGFloat angle = (float)(indexPath.row+angleOffset)/itemCounts*M_PI*2;

    
    //这个方法返回一个新的CATransform3D对象，在原来的基础上进行旋转效果的追加
    //第一个参数为旋转的弧度，后三个分别对应x，y，z轴，我们需要以x轴进行旋转
    trans3D = CATransform3DRotate(trans3D, angle, 1.0, 0, 0);
    //这个方法也返回一个transform3D对象，追加平移效果，后面三个参数，对应平移的x，y，z轴，我们沿z轴平移
    trans3D = CATransform3DTranslate(trans3D, 0, 0, radius);
    //进行设置
    atti.transform3D = trans3D;
    
    atti.center = CGPointMake(self.collectionView.frame.size.width/2, self.collectionView.frame.size.height/2+self.collectionView.contentOffset.y);
        
    return atti;
}

- (CGSize)collectionViewContentSize {
    return CGSizeMake(self.collectionView.frame.size.width, self.collectionView.frame.size.height*[self.collectionView numberOfItemsInSection:0]);
}

//返回yes，则一有变化就会刷新布局
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

@end
