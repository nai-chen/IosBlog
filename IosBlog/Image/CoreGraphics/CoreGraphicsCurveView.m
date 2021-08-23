//
//  CoreGraphicsCurveView.m
//  IosBlog
//
//  Created by PeterChen on 2021/8/20.
//

#import "CoreGraphicsCurveView.h"

@implementation CoreGraphicsCurveView

- (void)drawRect:(CGRect)rect {
    [[UIColor whiteColor] setFill];
    UIRectFill(rect);
    
    [self drawAracToPoint];
    [self drawQuadCurve];
    [self drawCurve];
}

- (void)drawAracToPoint {
    CGContextRef contex = UIGraphicsGetCurrentContext();
    CGContextSaveGState(contex);
    
    [[UIColor redColor] setStroke];
    CGContextSetLineWidth(contex, 5);
    CGContextMoveToPoint(contex, 20, 100);

    CGContextAddArcToPoint(contex, 120, 100, 80, 20, 20);
    CGContextStrokePath(contex);
    
    [[UIColor blackColor] setStroke];
    CGContextSetLineWidth(contex, 1);
    
    CGContextMoveToPoint(contex, 87, 80);
    CGContextAddLineToPoint(contex, 67, 80);
    CGContextStrokePath(contex);
    
    CGContextMoveToPoint(contex, 20, 100);
    CGContextAddLineToPoint(contex, 120, 100);
    CGContextAddLineToPoint(contex, 80, 20);
    CGFloat lengths[] = {6, 3};
    CGContextSetLineDash(contex, 0, lengths, 2);
    CGContextStrokePath(contex);

    CGContextAddArc(contex, 87, 80, 20, 0, M_PI*2, 0);
    CGContextStrokePath(contex);

    NSDictionary *attrs = @{
        NSFontAttributeName : [UIFont systemFontOfSize:12],
        NSForegroundColorAttributeName : [UIColor blackColor]
    };
    [@"r" drawInRect:CGRectMake(75, 65, 50, 20) withAttributes:attrs];
    [@"P(x, y)" drawInRect:CGRectMake(10, 80, 50, 20) withAttributes:attrs];
    [@"(x1, y1)" drawInRect:CGRectMake(120, 80, 50, 20) withAttributes:attrs];
    [@"(x2, y2)" drawInRect:CGRectMake(85, 10, 50, 20) withAttributes:attrs];
    
    CGContextRestoreGState(contex);
}

- (void)drawQuadCurve {
    CGContextRef contex = UIGraphicsGetCurrentContext();
    CGContextSaveGState(contex);
    
    [[UIColor redColor] setStroke];
    CGContextSetLineWidth(contex, 5);
    CGContextMoveToPoint(contex, 20, 250);

    CGContextAddQuadCurveToPoint(contex, 130, 150, 200, 250);
    CGContextStrokePath(contex);
    
    [[UIColor blackColor] setStroke];
    CGContextSetLineWidth(contex, 1);
    
    CGContextMoveToPoint(contex, 20, 250);
    CGContextAddLineToPoint(contex, 130, 150);
    CGContextAddLineToPoint(contex, 200, 250);
    CGFloat lengths[] = {6, 3};
    CGContextSetLineDash(contex, 0, lengths, 2);
    CGContextStrokePath(contex);

    NSDictionary *attrs = @{
        NSFontAttributeName : [UIFont systemFontOfSize:12],
        NSForegroundColorAttributeName : [UIColor blackColor]
    };
    [@"P" drawInRect:CGRectMake(20, 230, 50, 20) withAttributes:attrs];
    [@"(cpx, cpy)" drawInRect:CGRectMake(135, 140, 80, 20) withAttributes:attrs];
    [@"(x, y)" drawInRect:CGRectMake(200, 230, 50, 20) withAttributes:attrs];

    CGContextRestoreGState(contex);
}

- (void)drawCurve {
    CGContextRef contex = UIGraphicsGetCurrentContext();
    CGContextSaveGState(contex);
    
    [[UIColor redColor] setStroke];
    CGContextSetLineWidth(contex, 5);
    CGContextMoveToPoint(contex, 20, 350);

    CGContextAddCurveToPoint(contex, 100, 280, 180, 400, 200, 350);
    CGContextStrokePath(contex);
    
    [[UIColor blackColor] setStroke];
    CGContextSetLineWidth(contex, 1);
    
    CGContextMoveToPoint(contex, 20, 350);
    CGContextAddLineToPoint(contex, 100, 280);
    CGContextAddLineToPoint(contex, 180, 400);
    CGContextAddLineToPoint(contex, 200, 350);
    CGFloat lengths[] = {6, 3};
    CGContextSetLineDash(contex, 0, lengths, 2);
    CGContextStrokePath(contex);

    NSDictionary *attrs = @{
        NSFontAttributeName : [UIFont systemFontOfSize:12],
        NSForegroundColorAttributeName : [UIColor blackColor]
    };
    [@"P" drawInRect:CGRectMake(20, 330, 50, 20) withAttributes:attrs];
    [@"(cp1x, cp1y)" drawInRect:CGRectMake(105, 255, 80, 20) withAttributes:attrs];
    [@"(cp2x, cp2y)" drawInRect:CGRectMake(180, 400, 80, 20) withAttributes:attrs];
    [@"(x, y)" drawInRect:CGRectMake(200, 330, 50, 20) withAttributes:attrs];

    CGContextRestoreGState(contex);
}

@end
