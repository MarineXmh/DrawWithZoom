//
//  DrawingView.h
//  Draw
//
//  Created by Xu Menghua on 16/1/4.
//  Copyright © 2016年 Xu Menghua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawingPen.h"
#import "PointOnImage.h"

@interface DrawingView : UIView

@property (nonatomic, strong) DrawingPen *pen;

@property (nonatomic, assign) UIColor *lineColor;
@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, assign) CGFloat lineAlpha;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSMutableArray *pathArray;
@property (nonatomic, strong) NSMutableArray *pointsArray;
@property (nonatomic, strong) NSMutableArray *linesArray;
@property (nonatomic, assign) int startFlag;
@property (nonatomic, assign) CGFloat scale;

- (id)initWithFrame:(CGRect)frame scale:(CGFloat)scale;
- (void)clear;

@end
