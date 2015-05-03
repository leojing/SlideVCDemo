//
//  HomeViewController.h
//  SlideVCDemo
//
//  Created by luojing on 14-8-20.
//  Copyright (c) 2014年 luojing. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HomeViewController;

@protocol HomeViewControllerDelegate <NSObject>

@required
- (void)backButtonActionWithHomeVC:(HomeViewController *)vc;

@end

@interface HomeViewController : UIViewController

@property (nonatomic, weak) id<HomeViewControllerDelegate> homeDelegate;
//@property (nonatomic, strong) UINavigationController *nav;

@end
