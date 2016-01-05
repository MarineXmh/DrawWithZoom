//
//  ZoomView.h
//  Draw
//
//  Created by Xu Menghua on 16/1/4.
//  Copyright © 2016年 Xu Menghua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawingView.h"

@protocol ZoomViewTapDelegate <NSObject>
- (void) zoomViewDidTap;

@end

@interface ZoomView : UIScrollView <UIScrollViewDelegate>

{
    float theMinimumScale;
}
@property (assign, nonatomic) CGRect  *origRect;
@property (strong, nonatomic) UIImage *origImg;
@property (strong, nonatomic) UIImageView *imageView;
@property (assign, nonatomic) id<ZoomViewTapDelegate> tapDelegate;
@property (assign, nonatomic) CGFloat zvScale;
@property (assign, nonatomic) CGPoint imgCenter;
@property (assign, nonatomic) BOOL hasTransDirection;
@property (nonatomic, strong) DrawingView *drawingView;
- (id) initWithFrame:(CGRect)frame andImage:(UIImage *)image;
- (id) initWithFrame:(CGRect)frame andImage:(UIImage *)image ifNeedTrans:(BOOL)needTrans;
- (void)setZoomViewScale;

@end
