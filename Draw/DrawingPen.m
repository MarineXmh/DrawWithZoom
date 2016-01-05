//
//  DrawingPen.m
//  Draw
//
//  Created by Xu Menghua on 16/1/4.
//  Copyright © 2016年 Xu Menghua. All rights reserved.
//

#import "DrawingPen.h"

CGPoint midPoint(CGPoint p1, CGPoint p2) {
    return CGPointMake((p1.x + p2.x) * 0.5, (p1.y + p2.y) * 0.5);
}

@implementation DrawingPen

- (id)init {
    self = [super init];
    if (self != nil) {
        self.lineCapStyle = kCGLineCapRound;
    }
    return self;
}

- (void)setInitialPoint:(CGPoint)firstPoint {
    [self moveToPoint:firstPoint];
}

- (void)moveFromPoint:(CGPoint)startPoint toPoint:(CGPoint)endPoint {
    [self addQuadCurveToPoint:midPoint(endPoint, startPoint) controlPoint:startPoint];
}

- (void)draw {
    [self.lineColor setStroke];
    [self strokeWithBlendMode:kCGBlendModeNormal alpha:self.lineAlpha];
}

- (void)drawLineFirstPoint:(CGPoint)firstPoint LastPoint:(CGPoint)lastPoint {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // set the line properties
    CGContextSetStrokeColorWithColor(context, self.lineColor.CGColor);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, self.lineWidth);
    CGContextSetAlpha(context, self.lineAlpha);
    
    // draw the line
    CGContextMoveToPoint(context, firstPoint.x, firstPoint.y);
    CGContextAddLineToPoint(context, lastPoint.x, lastPoint.y);
    CGContextStrokePath(context);
}

@end
