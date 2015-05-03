//
//  NavViewController.m
//  SlideVCDemo
//
//  Created by luojing on 14-8-20.
//  Copyright (c) 2014年 luojing. All rights reserved.
//

#import "NavViewController.h"

@interface NavViewController () {
    NSInteger slidState; // 0表示在中间，1表示左边vc显示，2表示右边vc显示
}

@end

@implementation NavViewController

@synthesize homeVC = _homeVC;
@synthesize leftVC = _leftVC;
@synthesize rightVC = _rightVC;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)setHomeVC:(UIViewController *)homeVC {
    if (homeVC != nil) {
        homeVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        [self.view addSubview:homeVC.view];
        
        _homeVC = homeVC;
    }
}

- (void)setLeftVC:(UIViewController *)leftVC {
    if (leftVC != nil) {
        leftVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        [self.view addSubview:leftVC.view];
        
        _leftVC = leftVC;
    }
}

- (void)setRightVC:(UIViewController *)rightVC {
    if (rightVC != nil) {
        rightVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        [self.view addSubview:rightVC.view];
        
        _rightVC = rightVC;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    
    slidState = 0;
    
    UISwipeGestureRecognizer* rightRecognizer;
    // handleSwipeFrom 是偵測到手势，所要呼叫的方法
    rightRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    // 不同的 Recognizer 有不同的实体变数
    // 例如 SwipeGesture 可以指定方向
    // 而 TapGesture 則可以指定次數
    rightRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:rightRecognizer];
    
    UISwipeGestureRecognizer* leftRecognizer;
    // handleSwipeFrom 是偵測到手势，所要呼叫的方法
    leftRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    // 不同的 Recognizer 有不同的实体变数
    // 例如 SwipeGesture 可以指定方向
    // 而 TapGesture 則可以指定次數
    leftRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:leftRecognizer];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - HomeViewControllerDelegate Methods

- (void)backButtonActionWithHomeVC:(HomeViewController *)vc {
    [UIView animateWithDuration:0.3 animations:^{
        self.homeVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    }];

    slidState = 0;
}

- (void)handleSwipeFrom:(UIGestureRecognizer *)gestureRecognizer {
    UISwipeGestureRecognizer *g = (UISwipeGestureRecognizer *)gestureRecognizer;
    if (g.direction == UISwipeGestureRecognizerDirectionRight) {
        if (slidState == 0) {
            [UIView animateWithDuration:0.3 animations:^{
                self.homeVC.view.frame = CGRectMake(250, 60, self.view.frame.size.width, self.view.frame.size.height-120);
                self.rightVC.view.hidden = YES;
                self.leftVC.view.hidden = NO;
            }];
            
            slidState = 1;
        } else if (slidState == 1 || slidState == 2) {
            [UIView animateWithDuration:0.3 animations:^{
                self.homeVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            }];
            
            slidState = 0;
        }
    }
    if (g.direction == UISwipeGestureRecognizerDirectionLeft) {
        if (slidState == 0) {
            [UIView animateWithDuration:0.3 animations:^{
                self.homeVC.view.frame = CGRectMake(-250, 60, self.view.frame.size.width, self.view.frame.size.height-120);
                self.rightVC.view.hidden = NO;
                self.leftVC.view.hidden = YES;
            }];
            
            slidState = 2;
        } else if (slidState == 1 || slidState == 2) {
            [UIView animateWithDuration:0.3 animations:^{
                self.homeVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            }];
            
            slidState = 0;
        }
    }
}

@end
