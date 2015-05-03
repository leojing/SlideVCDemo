//
//  HomeViewController.m
//  SlideVCDemo
//
//  Created by luojing on 14-8-20.
//  Copyright (c) 2014年 luojing. All rights reserved.
//

#import "HomeViewController.h"
#import "NextViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

@synthesize homeDelegate = _homeDelegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self initUI];
    }
    return self;
}

- (void)setHomeDelegate:(id<HomeViewControllerDelegate>)homeDelegate {
    _homeDelegate = homeDelegate;
}

- (void)initUI {
    UIButton *_leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[_leftButton setTitle:@"back" forState:UIControlStateNormal];
    _leftButton.backgroundColor = [UIColor redColor];
	_leftButton.frame = CGRectMake(0, 0, 60, 30);
	[_leftButton addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
	UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:_leftButton];
    
	if ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0) {
		UIBarButtonItem *negativeSeperator = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
		negativeSeperator.width = 10;
		[self.navigationItem setLeftBarButtonItems:@[negativeSeperator, backItem]];
	}
	else {
		self.navigationItem.leftBarButtonItem = backItem;
	}
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    UIButton *nextButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    nextButton.backgroundColor = [UIColor whiteColor];
    [nextButton setTitle:@"next" forState:UIControlStateNormal];
    [nextButton addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - Actions Methods

- (void)backAction:(id)sender {
    if (self.homeDelegate != nil && [self.homeDelegate respondsToSelector:@selector(backButtonActionWithHomeVC:)]) {
        [self.homeDelegate backButtonActionWithHomeVC:self];
    }
}

- (void)nextAction:(id)sender {
    NextViewController *vc = [[NextViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
