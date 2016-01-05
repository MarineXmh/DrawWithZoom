//
//  PointOnImage.m
//  Draw
//
//  Created by Xu Menghua on 16/1/4.
//  Copyright © 2016年 Xu Menghua. All rights reserved.
//

#import "PointOnImage.h"

@implementation PointOnImage

+ (PointOnImage *)pointWithX:(CGFloat)x Y:(CGFloat)y scale:(CGFloat)scale {
    PointOnImage *point = [[PointOnImage alloc] init];
    point.x = x / scale;
    point.y = y / scale;
    return point;
}

+ (CGPoint)pointOnViewWithX:(CGFloat)x Y:(CGFloat)y scale:(CGFloat)scale {
    CGPoint point = CGPointMake(x * scale, y * scale);
    return point;
}

@end
