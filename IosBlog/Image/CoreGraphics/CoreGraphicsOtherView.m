//
//  CoreGraphicsOtherView.m
//  IosBlog
//
//  Created by PeterChen on 2021/8/20.
//

#import "CoreGraphicsOtherView.h"

@implementation CoreGraphicsOtherView

- (void)drawRect:(CGRect)rect {
    [[UIColor whiteColor] setFill];
    UIRectFill(rect);
    
    [self drawStrokeLineSegments];
    [self drawRect];
    [self drawEllipse];
}

- (void)drawStrokeLineSegments {
    CGContextRef contex = UIGraphicsGetCurrentContext();
    CGContextSaveGState(contex);
    
    [[UIColor redColor] setStroke];
    CGContextSetLineWidth(contex, 5);

    CGPoint points[] = {CGPointMake(10, 10), CGPointMake(100, 50),
        CGPointMake(100, 50), CGPointMake(10, 90)};
    CGContextStrokeLineSegments(contex, points, 4);
    
    CGContextRestoreGState(contex);
}

- (void)drawRect {
    CGContextRef contex = UIGraphicsGetCurrentContext();
    CGContextSaveGState(contex);
    
    [[UIColor redColor] setStroke];
    CGContextSetLineWidth(contex, 5);
    CGContextStrokeRect(contex, CGRectMake(10, 110, 80, 60));
    
    [[UIColor blueColor] setStroke];
    CGContextStrokeRectWithWidth(contex, CGRectMake(120, 110, 80, 60), 1);
    
    [[UIColor redColor] setFill];
    CGContextFillRect(contex, CGRectMake(10, 190, 80, 60));
    
    [[UIColor blueColor] setFill];
    CGRect rects[] = {CGRectMake(10, 270, 80, 60), CGRectMake(120, 270, 60, 60)};
    CGContextFillRects(contex, rects, 2);
    
    CGContextRestoreGState(contex);
}

- (void)drawEllipse {
    CGContextRef contex = UIGraphicsGetCurrentContext();
    CGContextSaveGState(contex);
    
    [[UIColor redColor] setStroke];
    CGContextSetLineWidth(contex, 5);
    CGContextStrokeEllipseInRect(contex, CGRectMake(10, 350, 80, 60));
    
    [[UIColor blueColor] setStroke];
    CGContextFillEllipseInRect(contex, CGRectMake(120, 350, 80, 60));
    
    CGContextRestoreGState(contex);
}

@end
