//
//  VKGradientBarView.m
//  testGradientLayer
//
//  Created by Evan on 2017/3/15.
//  Copyright © 2017年 vanke. All rights reserved.
//

#import "VKGradientBarView.h"

#define degressToRadius(ang) (M_PI*(ang)/180.0f) //把角度转换成PI的方式
#define RYUIColorWithRGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define XRGB(r,g,b)     [UIColor colorWithRed:(0x##r)/255.0 green:(0x##g)/255.0 blue:(0x##b)/255.0 alpha:1]
#define COLOR_PINK      XRGB(e6, 00, 12)   //红色
#define PROGRESS_LINE_WIDTH 4 //弧线的宽度


@interface VKGradientBarView ()

@property (nonatomic, strong)CAShapeLayer *progressLayer;


@end

@implementation VKGradientBarView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self gradentWith:frame];
    }
    return self;
}

- (void)gradentWith:(CGRect)frame{

    UIBezierPath *gradientPath = [[UIBezierPath alloc] init];
    [gradientPath moveToPoint:CGPointMake(0, CGRectGetMaxY(self.bounds))];
    [gradientPath addLineToPoint:CGPointMake(100, 50)];
    [gradientPath addLineToPoint:CGPointMake(150, 100)];
    [gradientPath addLineToPoint:CGPointMake(200, 130)];
    [gradientPath addLineToPoint:CGPointMake(self.bounds.size.width-50, 100)];
    [gradientPath addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height)];
    gradientPath.lineWidth = 3.0f;
    
    CAShapeLayer *arc = [CAShapeLayer layer];
    arc.path = gradientPath.CGPath;
    
    
    CAGradientLayer *gradientLayer =  [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    gradientLayer.colors = [NSArray arrayWithObjects:
                            (id)[COLOR_PINK CGColor],
                            (__bridge id)[UIColor colorWithWhite:1 alpha:0.1].CGColor, nil];
    gradientLayer.locations=@[@0.0,@1.0];
    gradientLayer.startPoint = CGPointMake(0.0,0.0);
    gradientLayer.endPoint = CGPointMake(0.0,1);
    gradientLayer.mask = arc;
    [self.layer addSublayer:gradientLayer];
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 6;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    pathAnimation.fromValue= [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue= [NSNumber numberWithFloat:1.0f];
    pathAnimation.autoreverses=NO;
    pathAnimation.repeatCount = INFINITY;
    [gradientLayer addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
}
@end
