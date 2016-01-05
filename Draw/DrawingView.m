//
//  DrawingView.m
//  Draw
//
//  Created by Xu Menghua on 16/1/4.
//  Copyright © 2016年 Xu Menghua. All rights reserved.
//

#import "DrawingView.h"
#import <QuartzCore/QuartzCore.h>

@implementation DrawingView

- (void)dealloc {
    self.pathArray = nil;
    self.pen = nil;
    self.image = nil;
    self.pointsArray = nil;
    self.linesArray = nil;
}

- (id)initWithFrame:(CGRect)frame scale:(CGFloat)scale{
    self = [super initWithFrame:frame];
    if (self) {
        self.scale = scale;
        self.lineColor = [UIColor blackColor];
        self.lineWidth = 5.0f * self.scale;
        self.lineAlpha = 1.0f;
        self.backgroundColor = [UIColor clearColor];
        self.pathArray = [[NSMutableArray alloc] init];
        self.pointsArray = [[NSMutableArray alloc] init];
        self.linesArray = [[NSMutableArray alloc] init];
        self.startFlag = 0;
    }
    return self;
}

- (void)setScale:(CGFloat)scale {
    if (_scale != scale) {
        _scale = scale;
        self.lineWidth = 5.0f * _scale;
    }
}

- (void)drawRect:(CGRect)rect {
    [self.image drawInRect:self.bounds];
    [self.pen draw];
}

- (void)updateCacheImage:(BOOL)redraw {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0.0);
    if (redraw) {
        self.image = nil;
        for (DrawingPen *pen in self.pathArray) {
            [pen draw];
        }
    } else {
        for (NSMutableArray *line in self.linesArray) {
            for (int i = 0;i + 1 < line.count; i += 1) {
                PointOnImage *firstPoint = line[i];
                PointOnImage *lastPoint = line[i + 1];
                [self.pen drawLineFirstPoint:[PointOnImage pointOnViewWithX:firstPoint.x Y:firstPoint.y scale:self.scale] LastPoint:[PointOnImage pointOnViewWithX:lastPoint.x Y:lastPoint.y scale:self.scale]];
//                NSLog(@"1:%f,%f  2:%f,%f", firstPoint.x, firstPoint.y, lastPoint.x, lastPoint.y);
            }
        }
    }
    self.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if (self.startFlag == 1) {
        self.pen = [[DrawingPen alloc] init];
        self.pen.lineWidth = self.lineWidth;
        self.pen.lineColor = self.lineColor;
        self.pen.lineAlpha = self.lineAlpha;
        self.pointsArray = [[NSMutableArray alloc] init];
        [self.pathArray addObject:self.pen];
        UITouch *touch = [touches anyObject];
        PointOnImage *point = [PointOnImage pointWithX:[touch locationInView:self].x Y:[touch locationInView:self].y scale:self.scale];
        [self.pointsArray addObject:point];
        [self.pen setInitialPoint:[touch locationInView:self]];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    if (self.startFlag == 1) {
        UITouch *touch = [touches anyObject];
        CGPoint currentLocation = [touch locationInView:self];
        CGPoint previousLocation = [touch previousLocationInView:self];
        PointOnImage *point = [PointOnImage pointWithX:[touch locationInView:self].x Y:[touch locationInView:self].y scale:self.scale];
        [self.pointsArray addObject:point];
        [self.pen moveFromPoint:previousLocation toPoint:currentLocation];
        [self setNeedsDisplay];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (self.startFlag == 1) {
        [self touchesMoved:touches withEvent:event];
        [self.linesArray addObject:self.pointsArray];
        [self updateCacheImage:NO];
        self.pen = nil;
        self.pointsArray = nil;
    }
}

- (void)clear {
    [self.pathArray removeAllObjects];
    [self.linesArray removeAllObjects];
    [self.pointsArray removeAllObjects];
    [self updateCacheImage:YES];
    [self setNeedsDisplay];
}

@end
