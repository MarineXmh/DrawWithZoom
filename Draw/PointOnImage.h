//
//  PointOnImage.h
//  Draw
//
//  Created by Xu Menghua on 16/1/4.
//  Copyright © 2016年 Xu Menghua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PointOnImage : NSObject

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;

+ (PointOnImage *)pointWithX:(CGFloat)x Y:(CGFloat)y scale:(CGFloat)scale;
+ (CGPoint)pointOnViewWithX:(CGFloat)x Y:(CGFloat)y scale:(CGFloat)scale;

@end
