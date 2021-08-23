//
//  UIBezierPathView.m
//  IosBlog
//
//  Created by PeterChen on 2021/8/23.
//

#import "UIBezierPathView.h"

@implementation UIBezierPathView

- (void)drawRect:(CGRect)rect {
    [[UIColor whiteColor] setFill];
    UIRectFill(rect);

    [self drawStroke];
}

- (void)drawStroke {
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path setLineWidth:3];
    [[UIColor redColor] setStroke];
    
    [path moveToPoint:CGPointMake(10, 10)];
    [path addLineToPoint:CGPointMake(250, 10)];

    [path stroke];
    
    UIBezierPath *lineCapPath = [UIBezierPath bezierPath];
    [lineCapPath setLineWidth:5];
    [lineCapPath moveToPoint:CGPointMake(10, 30)];
    [lineCapPath addLineToPoint:CGPointMake(250, 30)];
    lineCapPath.lineCapStyle = kCGLineCapRound;
    
    [lineCapPath stroke];

    UIBezierPath *lineJoinPath = [UIBezierPath bezierPath];
    [lineJoinPath setLineWidth:5];
    [lineJoinPath moveToPoint:CGPointMake(10, 50)];
    [lineJoinPath addLineToPoint:CGPointMake(80, 75)];
    [lineJoinPath addLineToPoint:CGPointMake(10, 100)];
    lineJoinPath.lineJoinStyle = kCGLineJoinRound;
    [lineJoinPath closePath];
    
    [lineJoinPath stroke];

    UIBezierPath *lineDashPath = [UIBezierPath bezierPath];
    [lineDashPath moveToPoint:CGPointMake(10, 120)];
    [lineDashPath addLineToPoint:CGPointMake(250, 120)];
    CGFloat pattern[] = {6, 3, 6, 3};
    [lineDashPath setLineDash:pattern count:4 phase:0];

    [lineDashPath stroke];
}

@end
