//
//  ViewController.m
//  Draw
//
//  Created by Xu Menghua on 16/1/4.
//  Copyright © 2016年 Xu Menghua. All rights reserved.
//

#import "ViewController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.zoomView = [[ZoomView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) andImage:[UIImage imageNamed:@"001"] ifNeedTrans:YES];
    [self.view addSubview:self.zoomView];
    
    self.drawBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.drawBtn setTitle:@"start draw" forState:UIControlStateNormal];
    [self.drawBtn setTitle:@"drawing" forState:UIControlStateSelected];
    [self.drawBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.drawBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    self.drawBtn.frame = CGRectMake(10, 10, 100, 20);
    [self.view addSubview:self.drawBtn];
    [self.drawBtn addTarget:self action:@selector(startDraw) forControlEvents:UIControlEventTouchUpInside];
    
    self.clearBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.clearBtn setTitle:@"clear" forState:UIControlStateNormal];
    [self.clearBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.clearBtn.frame = CGRectMake(120, 10, 60, 20);
    [self.view addSubview:self.clearBtn];
    [self.clearBtn addTarget:self action:@selector(clearDraw) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startDraw {
    self.drawBtn.selected = !self.drawBtn.selected;
    if (self.drawBtn.selected) {
        [self.zoomView setScrollEnabled:NO];
        self.zoomView.drawingView.startFlag = 1;
    } else {
        [self.zoomView setScrollEnabled:YES];
        self.zoomView.drawingView.startFlag = 0;
    }
}

- (void)clearDraw {
    [self.zoomView.drawingView clear];
}

@end
