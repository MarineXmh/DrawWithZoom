//
//  ViewController.h
//  Draw
//
//  Created by Xu Menghua on 16/1/4.
//  Copyright © 2016年 Xu Menghua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZoomView.h"
#import "DrawingView.h"

@interface ViewController : UIViewController

@property (nonatomic, strong) ZoomView *zoomView;

@property (nonatomic, strong) UIButton *drawBtn;
@property (nonatomic, strong) UIButton *clearBtn;

@end
