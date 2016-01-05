//
//  ZoomView.m
//  Draw
//
//  Created by Xu Menghua on 16/1/4.
//  Copyright © 2016年 Xu Menghua. All rights reserved.
//

#import "ZoomView.h"

@implementation ZoomView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.drawingView = [[DrawingView alloc] initWithFrame:frame];
        self.drawingView.scale = self.imageView.frame.size.width / self.imageView.image.size.width;
        [self addSubview:self.drawingView];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame andImage:(UIImage *)image {
    self = [self initWithFrame:frame andImage:image ifNeedTrans:YES];
    return self;
}

- (id)initWithFrame:(CGRect)frame andImage:(UIImage *)image ifNeedTrans:(BOOL)needTrans {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.delegate = self;
        self.userInteractionEnabled = YES;
        
        _imageView = [[UIImageView alloc] initWithImage:image];
        
        NSData *data = UIImageJPEGRepresentation(image, 1);
        if (data == nil || data.length == 0) {
            return self;
        }
        
        float tempImgW = 0;
        float tempImgH = 0;
        float tempImgY = 0;
        float tempImgX = 0;
        
        if (needTrans == YES) {
            tempImgW = self.frame.size.width;
            tempImgH = (tempImgW/image.size.width)*image.size.height;
            if (self.frame.size.height>tempImgH) {
                tempImgY = (self.frame.size.height-tempImgH)/2;
            }
        }else{
            float tempW = self.frame.size.width >self.frame.size.height ? self.frame.size.width : self.frame.size.height ;
            float tempH = self.frame.size.width <self.frame.size.height ? self.frame.size.width : self.frame.size.height ;
            float proportionDevice = tempW/tempH;
            float proportionImg = image.size.width/image.size.height;
            if (proportionImg<proportionDevice) {
                tempImgH = self.frame.size.height;
                tempImgW = (tempImgH/image.size.height)*image.size.width;
                if (self.frame.size.width>tempImgW) {
                    tempImgX = (self.frame.size.width-tempImgW)/2;
                }
            }
        }
        
        _imageView.frame = CGRectMake(tempImgX, tempImgY, tempImgW, tempImgH);
        _imageView.image = image;
        
        self.imageView.userInteractionEnabled = YES;
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self addSubview:self.imageView];
        self.origImg = image;
        self.contentSize = CGSizeMake(tempImgW, tempImgH);
        
        [self setMinimumZoomScale:1.0];
        [self setMaximumZoomScale:3.0];
        [self setZoomViewScale];
        
        UITapGestureRecognizer *tapgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnImageView:)];
        [tapgr setNumberOfTapsRequired:1];
        [self.imageView addGestureRecognizer:tapgr];
        
        self.drawingView = [[DrawingView alloc] initWithFrame:frame scale:(self.imageView.frame.size.width / self.imageView.image.size.width)];
        [self addSubview:self.drawingView];
    }
    return self;
}

- (void)tapOnImageView:(id)sender {
    [self.tapDelegate zoomViewDidTap];
}

- (void)setZoomViewScale {
    [self setZoomScale:self.zvScale];
}

#pragma mark UIScrollViewDelegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    if (self.hasTransDirection) {
        //CGFloat offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width)?(scrollView.bounds.size.width - scrollView.contentSize.width)/2 : 0.0;
        //CGFloat offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height)?(scrollView.bounds.size.height - scrollView.contentSize.height)/2 : 0.0;
        //self.imageView.center = CGPointMake(scrollView.contentSize.height/2 + offsetY, scrollView.contentSize.width/2 + offsetX);
    }else {
        CGFloat offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width)?(scrollView.bounds.size.width - scrollView.contentSize.width)/2 : 0.0;
        CGFloat offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height)?(scrollView.bounds.size.height - scrollView.contentSize.height)/2 : 0.0;
        self.imageView.center = CGPointMake(scrollView.contentSize.width/2 + offsetX,scrollView.contentSize.height/2 + offsetY);
        self.drawingView.frame = self.imageView.frame;
        self.drawingView.scale = self.imageView.frame.size.width / self.imageView.image.size.width;
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
}

@end
