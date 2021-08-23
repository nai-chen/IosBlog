//
//  CoreGraphicsView.m
//  IosBlog
//
//  Created by PeterChen on 2021/8/20.
//

#import "CoreGraphicsView.h"

@implementation CoreGraphicsView

- (void)drawRect:(CGRect)rect {
    NSLog(@"CoreGraphicsView %@", NSStringFromCGRect(rect));
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillRect(context, rect);

    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextSetLineWidth(context, 5);
    CGContextStrokeRect(context, CGRectMake(10, 10, 80, 80));
}

@end
