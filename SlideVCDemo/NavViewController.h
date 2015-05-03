//
//  NavViewController.h
//  SlideVCDemo
//
//  Created by luojing on 14-8-20.
//  Copyright (c) 2014年 luojing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"
#import "LeftViewController.h"
#import "RightViewController.h"

@interface NavViewController : UIViewController <HomeViewControllerDelegate>{
}

@property (nonatomic, strong) UIViewController *homeVC;
@property (nonatomic, strong) UIViewController *leftVC;
@property (nonatomic, strong) UIViewController *rightVC;


@end
