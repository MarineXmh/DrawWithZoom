//
//  DrawingPen.h
//  Draw
//
//  Created by Xu Menghua on 16/1/4.
//  Copyright © 2016年 Xu Menghua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawingPen : UIBezierPath

@property (nonatomic, strong) UIColor *lineColor;
@property (nonatomic, assign) CGFloat lineAlpha;

- (void)setInitialPoint:(CGPoint)firstPoint;
- (void)moveFromPoint:(CGPoint)startPoint toPoint:(CGPoint)endPoint;
- (void)draw;
- (void)drawLineFirstPoint:(CGPoint)firstPoint LastPoint:(CGPoint)lastPoint;

@end
