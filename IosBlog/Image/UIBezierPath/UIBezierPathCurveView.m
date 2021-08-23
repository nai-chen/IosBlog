//
//  UIBezierPathCurveView.m
//  IosBlog
//
//  Created by PeterChen on 2021/8/23.
//

#import "UIBezierPathCurveView.h"

@implementation UIBezierPathCurveView

- (void)drawRect:(CGRect)rect {
    [[UIColor whiteColor] setFill];
    UIRectFill(rect);
    
    [self drawQuadCurve];
    [self drawCurve];
}

- (void)drawQuadCurve {
    [[UIColor redColor] setStroke];

    UIBezierPath *quadCurvePath = [UIBezierPath bezierPath];
    quadCurvePath.lineWidth = 5;
    [quadCurvePath moveToPoint:CGPointMake(20, 150)];
    [quadCurvePath addQuadCurveToPoint:CGPointMake(200, 150) controlPoint:CGPointMake(130, 50)];
    [quadCurvePath stroke];
    
    [[UIColor blackColor] setStroke];
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint:CGPointMake(20, 150)];
    [linePath addLineToPoint:CGPointMake(130, 50)];
    [linePath addLineToPoint:CGPointMake(200, 150)];
    CGFloat pattern[] = {6, 3};
    [linePath setLineDash:pattern count:2 phase:0];
    [linePath stroke];
    
    NSDictionary *attrs = @{
        NSFontAttributeName : [UIFont systemFontOfSize:12],
        NSForegroundColorAttributeName : [UIColor blackColor]
    };
    [@"P" drawInRect:CGRectMake(20, 130, 50, 20) withAttributes:attrs];
    [@"(cpx, cpy)" drawInRect:CGRectMake(135, 40, 80, 20) withAttributes:attrs];
    [@"(x, y)" drawInRect:CGRectMake(200, 130, 50, 20) withAttributes:attrs];

}

- (void)drawCurve {
    [[UIColor redColor] setStroke];

    UIBezierPath *curvePath = [UIBezierPath bezierPath];
    curvePath.lineWidth = 5;
    [curvePath moveToPoint:CGPointMake(20, 250)];
    [curvePath addCurveToPoint:CGPointMake(200, 250) controlPoint1:CGPointMake(100, 180) controlPoint2:CGPointMake(180, 300)];
    [curvePath stroke];
    
    [[UIColor blackColor] setStroke];
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint:CGPointMake(20, 250)];
    [linePath addLineToPoint:CGPointMake(100, 180)];
    [linePath addLineToPoint:CGPointMake(180, 300)];
    [linePath addLineToPoint:CGPointMake(200, 250)];
    CGFloat pattern[] = {6, 3};
    [linePath setLineDash:pattern count:2 phase:0];
    [linePath stroke];

    NSDictionary *attrs = @{
        NSFontAttributeName : [UIFont systemFontOfSize:12],
        NSForegroundColorAttributeName : [UIColor blackColor]
    };
    [@"P" drawInRect:CGRectMake(20, 230, 50, 20) withAttributes:attrs];
    [@"(cp1x, cp1y)" drawInRect:CGRectMake(105, 165, 80, 20) withAttributes:attrs];
    [@"(cp2x, cp2y)" drawInRect:CGRectMake(180, 300, 80, 20) withAttributes:attrs];
    [@"(x, y)" drawInRect:CGRectMake(200, 230, 50, 20) withAttributes:attrs];
}

@end
