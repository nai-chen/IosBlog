//
//  CoreGraphicsNormalViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/8/20.
//

#import "CoreGraphicsNormalViewController.h"

#import "CoreGraphicsView.h"
#import "CoreGraphicsPushPopView.h"
#import "CoreGraphicsSaveRestoreView.h"

@interface CoreGraphicsNormalViewController ()

@property(nonatomic, strong) UIImageView *imageView;
@property(nonatomic, strong) CoreGraphicsView *coreGraphicsView;

@end

@implementation CoreGraphicsNormalViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.imageView];
    
    [self.view addSubview:self.coreGraphicsView];
    
    [self.view addSubview:[[CoreGraphicsPushPopView alloc] initWithFrame:CGRectMake(20, 220, 100, 100)]];
    [self.view addSubview:[[CoreGraphicsSaveRestoreView alloc] initWithFrame:CGRectMake(140, 220, 100, 100)]];
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 100, 100, 100)];
        
        UIGraphicsBeginImageContext(CGSizeMake(100, 100));
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
        CGContextSetLineWidth(context, 5);
        CGContextStrokeRect(context, CGRectMake(10, 10, 80, 80));
        
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        _imageView.image = image;
    }
    return _imageView;
}

- (CoreGraphicsView *)coreGraphicsView {
    if (!_coreGraphicsView) {
        _coreGraphicsView = [[CoreGraphicsView alloc] initWithFrame:CGRectMake(140, 100, 100, 100)];
    }
    return _coreGraphicsView;
}

@end
