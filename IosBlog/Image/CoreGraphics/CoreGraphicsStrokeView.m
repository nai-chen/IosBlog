//
//  CoreGraphicsStrokeView.m
//  IosBlog
//
//  Created by PeterChen on 2021/8/20.
//

#import "CoreGraphicsStrokeView.h"

@implementation CoreGraphicsStrokeView

- (void)drawRect:(CGRect)rect {
    [[UIColor whiteColor] setFill];
    UIRectFill(rect);
    
    [[UIColor redColor] setStroke];
 
    [self drawSetLineWidth];
    [self drawSetLineCap];
    [self drawSetLineJoin];
    [self drawSetLineDash];
}

- (void)drawSetLineWidth {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGContextSetLineWidth(context, 1);
    CGContextMoveToPoint(context, 10, 5);
    CGContextAddLineToPoint(context, 250, 5);
    CGContextStrokePath(context);
    
    CGContextSetLineWidth(context, 3);
    CGContextMoveToPoint(context, 10, 15);
    CGContextAddLineToPoint(context, 250, 15);
    CGContextStrokePath(context);

    CGContextSetLineWidth(context, 5);
    CGContextMoveToPoint(context, 10, 25);
    CGContextAddLineToPoint(context, 250, 25);
    CGContextStrokePath(context);
    
    CGContextRestoreGState(context);
}

- (void)drawSetLineCap {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGContextSetLineWidth(context, 5);

    CGContextMoveToPoint(context, 10, 55);
    CGContextAddLineToPoint(context, 250, 55);
    CGContextStrokePath(context);

    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextMoveToPoint(context, 10, 65);
    CGContextAddLineToPoint(context, 250, 65);
    CGContextStrokePath(context);

    CGContextSetLineCap(context, kCGLineCapSquare);
    CGContextMoveToPoint(context, 10, 75);
    CGContextAddLineToPoint(context, 250, 75);
    CGContextStrokePath(context);

    CGContextRestoreGState(context);
}

- (void)drawSetLineJoin {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGContextSetLineWidth(context, 5);

    CGContextMoveToPoint(context, 10, 105);
    CGContextAddLineToPoint(context, 60, 130);
    CGContextAddLineToPoint(context, 10, 155);
    CGContextStrokePath(context);

//    CGContextSetMiterLimit(context, 10);
    
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextMoveToPoint(context, 80, 105);
    CGContextAddLineToPoint(context, 130, 130);
    CGContextAddLineToPoint(context, 80, 155);
    CGContextStrokePath(context);

    CGContextSetLineJoin(context, kCGLineJoinBevel);
    CGContextMoveToPoint(context, 150, 105);
    CGContextAddLineToPoint(context, 200, 130);
    CGContextAddLineToPoint(context, 150, 155);
    CGContextStrokePath(context);

    CGContextRestoreGState(context);
}

- (void)drawSetLineDash {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGContextSetLineWidth(context, 3);
    CGFloat lengths[] = {6, 3, 6, 3};

    CGContextMoveToPoint(context, 10, 185);
    CGContextAddLineToPoint(context, 250, 185);
    CGContextSetLineDash(context, 0, lengths, 4);
    CGContextStrokePath(context);
    
    CGContextMoveToPoint(context, 10, 195);
    CGContextAddLineToPoint(context, 250, 195);
    CGContextSetLineDash(context, 5, lengths, 4);
    CGContextStrokePath(context);
    
    CGContextMoveToPoint(context, 10, 205);
    CGContextAddLineToPoint(context, 250, 205);
    CGContextSetLineDash(context, 0, lengths, 3);
    CGContextStrokePath(context);

    CGContextRestoreGState(context);
}

@end
