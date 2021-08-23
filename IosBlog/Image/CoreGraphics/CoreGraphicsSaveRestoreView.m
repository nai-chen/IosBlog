//
//  CoreGraphicsSaveRestoreView.m
//  IosBlog
//
//  Created by PeterChen on 2021/8/20.
//

#import "CoreGraphicsSaveRestoreView.h"

@implementation CoreGraphicsSaveRestoreView

- (void)drawRect:(CGRect)rect {
    [[UIColor redColor] setFill];
    
    CGContextSaveGState(UIGraphicsGetCurrentContext());
    [[UIColor blackColor] setFill];
    CGContextRestoreGState(UIGraphicsGetCurrentContext());
    
    UIRectFill(rect); // red color
}

@end
