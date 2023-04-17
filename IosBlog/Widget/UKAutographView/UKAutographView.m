//
//  UKAutographView.m
//  IosBlog
//
//  Created by PC010055 on 2023/4/17.
//

#import "UKAutographView.h"

@interface UKAutographView()

@property(nonatomic, strong) UIBezierPath *path;
@property(nonatomic, strong) NSMutableArray<UIBezierPath *> *paths;
@property(nonatomic, strong) NSMutableArray<NSValue *> *points;

@property(nonatomic, assign) CGFloat imageRatio;
@end

@implementation UKAutographView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.paths = [[NSMutableArray alloc] init];
        self.points = [[NSMutableArray alloc] init];
        self.imageRatio = 1.25;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setImageRatio:(CGFloat)ratio {
    _imageRatio = ratio;
}

- (void)clear {
    [self.paths removeAllObjects];
    [self.points removeAllObjects];
    
    [self setNeedsDisplay];
}

- (UIImage *)save {
    CGPoint point = self.points.firstObject.CGPointValue;
    CGFloat left = point.x;
    CGFloat right = point.x;
    CGFloat top = point.y;
    CGFloat bottom = point.y;
    
    for (NSValue *pointValue in self.points) {
        CGPoint point = pointValue.CGPointValue;
        if (point.x < left) {
            left = point.x;
        } else if (point.x > right) {
            right = point.x;
        }
        
        if (point.y < top) {
            top = point.y;
        } else if (point.y > bottom) {
            bottom = point.y;
        }
    }
    CGFloat height = bottom - top;
    CGFloat width = right - left;
    
    if (width / height > self.imageRatio) {
        CGFloat newHeight = width / self.imageRatio;
        top -= (newHeight - height) / 2;
        bottom = top + newHeight;
    } else {
        CGFloat newWidth = height * self.imageRatio;
        left -= (newWidth - width) / 2;
        right = left + newWidth;
    }
    
    CGRect imageRect = CGRectMake(left - 1, top - 1, right - left + 2, bottom - top + 2);

    // 开启上下文 参数1：CGSize size 尺寸, 参数2：BOOL opaque 透明度, 参数3：CGFloat scale 比例
    UIGraphicsBeginImageContextWithOptions(imageRect.size, NO, [UIScreen mainScreen].scale);

    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, -imageRect.origin.x, -imageRect.origin.y);
    
    // 获取图像
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    CGContextRestoreGState(context);
    
    UIImage *saveImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSLog(@"imageRect = %@", NSStringFromCGRect(imageRect));
    NSLog(@"saveImage.size = %@", NSStringFromCGSize(saveImage.size));
    NSLog(@"self.frame = %@", NSStringFromCGRect(self.frame));
    
    return saveImage;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 1.获取触摸对象
    UITouch *touch = touches.anyObject;
        
    // 2.获取触摸点
    CGPoint locP = [touch locationInView:touch.view];
        
    //3.创建绘图路径
    self.path = [[UIBezierPath alloc] init];
    self.path.lineWidth = 6;
    self.path.lineCapStyle = kCGLineCapRound;
    self.path.lineJoinStyle = kCGLineJoinRound;
        
    // 4.添加子路径
    [self.path moveToPoint:locP];
    [self.points addObject:[NSValue valueWithCGPoint:locP]];
        
    // 5.把path添加到数组中
    [self.paths addObject:self.path];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint locP = [touch locationInView:touch.view];
    
    [self.path addLineToPoint:locP];
    [self.points addObject:[NSValue valueWithCGPoint:locP]];
    
    [self setNeedsDisplay];
    
    if (self.delegate) {
        [self.delegate autographViewDidBegin:self];
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
}

- (void)drawRect:(CGRect)rect {
    //设置颜色
    [[UIColor blackColor] set];

    for (UIBezierPath *path in self.paths) {
        [path stroke];
    }
}

@end

