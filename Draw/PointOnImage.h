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

//将imageView上取得的点的坐标根据图片与imageView的比例转换成以图片为基准的坐标
+ (PointOnImage *)pointWithX:(CGFloat)x Y:(CGFloat)y scale:(CGFloat)scale;
//将以图片为基准的坐标中的点根据imageView与图片的比例转换成imageView坐标系的点
+ (CGPoint)pointOnViewWithX:(CGFloat)x Y:(CGFloat)y scale:(CGFloat)scale;

@end
