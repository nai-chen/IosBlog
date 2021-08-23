//
//  CoreGraphicsPathView.m
//  IosBlog
//
//  Created by PeterChen on 2021/8/20.
//

#import "CoreGraphicsPathView.h"

@implementation CoreGraphicsPathView

- (void)drawRect:(CGRect)rect {
    [[UIColor whiteColor] setFill];
    UIRectFill(rect);

    [self drawStroke];
    [self drawFill];
}

- (void)drawStroke {
    CGContextRef contex = UIGraphicsGetCurrentContext();
    CGContextSaveGState(contex);
    
    [[UIColor redColor] setStroke];
    CGContextSetLineWidth(contex, 3);
    
    CGContextMoveToPoint(contex, 10, 10);
    CGContextAddLineToPoint(contex, 60, 35);
    CGContextAddLineToPoint(contex, 10, 60);
    CGContextClosePath(contex);
    
    CGContextAddRect(contex, CGRectMake(10, 80, 80, 60));

    CGContextAddEllipseInRect(contex, CGRectMake(20, 160, 60, 60));

    CGContextAddEllipseInRect(contex, CGRectMake(5, 240, 90, 60));
    CGContextStrokePath(contex);
    
    CGContextAddArc(contex, 50, 350, 30, 0, M_PI_2, 0);
    CGContextStrokePath(contex);

    [[UIColor blueColor] setStroke];
    CGContextAddArc(contex, 50, 350, 30, 0, -M_PI, 1);
    CGContextStrokePath(contex);
    
    CGContextRestoreGState(contex);
}

- (void)drawFill {
    CGContextRef contex = UIGraphicsGetCurrentContext();
    CGContextSaveGState(contex);
    
    [[UIColor blueColor] setFill];
    
    CGPoint points[] = {CGPointMake(150, 10), CGPointMake(200, 35),
        CGPointMake(200, 35), CGPointMake(150, 60)};
    CGContextAddLines(contex, points, 4);
    CGContextClosePath(contex);
    
    CGContextAddRect(contex, CGRectMake(150, 80, 80, 60));

    CGContextAddEllipseInRect(contex, CGRectMake(160, 160, 60, 60));

    CGContextAddEllipseInRect(contex, CGRectMake(145, 240, 90, 60));
    CGContextFillPath(contex);
    
    CGContextAddArc(contex, 190, 350, 30, 0, M_PI_2, 0);
    CGContextFillPath(contex);

    [[UIColor greenColor] setFill];
    CGContextAddArc(contex, 190, 350, 30, 0, -M_PI, 1);
    CGContextFillPath(contex);

    CGContextRestoreGState(contex);
}

@end
