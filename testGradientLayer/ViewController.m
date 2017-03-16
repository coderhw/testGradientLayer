//
//  ViewController.m
//  testGradientLayer
//
//  Created by Evan on 2017/3/15.
//  Copyright © 2017年 vanke. All rights reserved.
//

#import "ViewController.h"
#import "VKGradientBarView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    VKGradientBarView *barView = [[VKGradientBarView alloc] initWithFrame:CGRectMake(0, 0,
                                                                                     CGRectGetMaxX(self.view.bounds),
                                                                                     500)];
    barView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:barView];

}




@end
