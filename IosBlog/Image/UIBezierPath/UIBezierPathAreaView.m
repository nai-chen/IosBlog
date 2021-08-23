//
//  UIBezierPathAreaView.m
//  IosBlog
//
//  Created by PeterChen on 2021/8/23.
//

#import "UIBezierPathAreaView.h"

@implementation UIBezierPathAreaView

- (void)drawRect:(CGRect)rect {
    [[UIColor whiteColor] setFill];
    UIRectFill(rect);

    [[UIColor redColor] setStroke];
    [self drawStrokeRect];
    
    [[UIColor blueColor] setFill];
    [self drawFillRect];
}

- (void)drawStrokeRect {
    UIBezierPath *rectBezierPath = [UIBezierPath bezierPathWithRect:CGRectMake(10, 10, 80, 60)];
    [rectBezierPath stroke];
    
    UIBezierPath *ovalBezierPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 90, 80, 60)];
    [ovalBezierPath stroke];
    
    UIBezierPath *roundedRectBezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 170, 80, 60) cornerRadius:10];
    [roundedRectBezierPath stroke];
    
    UIBezierPath *roundedRectBezierPath2 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 250, 80, 60)
                       byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:CGSizeMake(10, 10)];
    [roundedRectBezierPath2 stroke];
    
    UIBezierPath *arcBezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(50, 360) radius:30 startAngle:0 endAngle:M_PI_2 clockwise:YES];
    [arcBezierPath stroke];
    
    [[UIColor blueColor] setStroke];
    UIBezierPath *arcBezierPath2 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(50, 360) radius:30 startAngle:0 endAngle:-M_PI clockwise:NO];
    [arcBezierPath2 stroke];
}

- (void)drawFillRect {
    UIBezierPath *rectBezierPath = [UIBezierPath bezierPathWithRect:CGRectMake(150, 10, 80, 60)];
    [rectBezierPath fill];
    
    UIBezierPath *ovalBezierPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(150, 90, 80, 60)];
    [ovalBezierPath fill];
    
    UIBezierPath *roundedRectBezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(150, 170, 80, 60) cornerRadius:10];
    [roundedRectBezierPath fill];
    
    UIBezierPath *roundedRectBezierPath2 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(150, 250, 80, 60)
                       byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:CGSizeMake(10, 10)];
    [roundedRectBezierPath2 fill];
    
    UIBezierPath *arcBezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(190, 360) radius:30 startAngle:0 endAngle:M_PI_2 clockwise:YES];
    [arcBezierPath fill];
    
    [[UIColor redColor] setFill];
    UIBezierPath *arcBezierPath2 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(190, 360) radius:30 startAngle:0 endAngle:-M_PI clockwise:NO];
    [arcBezierPath2 fill];
}

@end
