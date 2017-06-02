//
//  ViewController.m
//  Signal Changes
//
//  Created by Detective Lawliet on 5/31/17.
//  Copyright © 2017 Detective Lawliet. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

CAShapeLayer *through;
CAShapeLayer *left;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Add partially trasparent background.
    UIView *background = [[UIView alloc] initWithFrame:CGRectMake(0, 536, 210, 200)];
    UIColor *color = [[UIColor alloc] initWithRed:0.0 green:0.0 blue:0.0 alpha:0.25];
    background.backgroundColor = color;
    [self.view addSubview:background];
    
    // Draw through.
    CGMutablePathRef throughPath = CGPathCreateMutable();
    
    CGPoint throughPoints[9];
    
    throughPoints[0] = CGPointMake(160, 581);
    throughPoints[1] = CGPointMake(185, 611);
    throughPoints[2] = CGPointMake(172.5, 611);
    throughPoints[3] = CGPointMake(172.5, 686);
    throughPoints[4] = CGPointMake(147.5, 686);
    throughPoints[5] = CGPointMake(147.5, 611);
    throughPoints[6] = CGPointMake(135, 611);
    throughPoints[7] = CGPointMake(160, 581);
    throughPoints[8] = CGPointMake(185, 611);
    
    CGPathAddLines(throughPath, NULL, throughPoints, 9);
    
    through = [CAShapeLayer layer];
    through.path = throughPath;
    through.strokeColor = [UIColor blackColor].CGColor;
    through.fillColor = [UIColor greenColor].CGColor;
    through.lineWidth = 4;
    through.lineCap = kCALineCapRound;
    through.lineJoin = kCALineJoinRound;
    
    CGPathRelease(throughPath);
    
    [self.view.layer addSublayer:through];
    
    // Draw through.
    CGMutablePathRef leftPath = CGPathCreateMutable();
    
    CGPoint leftPoints[11];
    
    leftPoints[0] = CGPointMake(20, 608.5);
    leftPoints[1] = CGPointMake(50, 633.5);
    leftPoints[2] = CGPointMake(50, 621);
    leftPoints[3] = CGPointMake(85, 621);
    leftPoints[4] = CGPointMake(85, 686);
    leftPoints[5] = CGPointMake(110, 686);
    leftPoints[6] = CGPointMake(110, 596);
    leftPoints[7] = CGPointMake(50, 596);
    leftPoints[8] = CGPointMake(50, 583.5);
    leftPoints[9] = CGPointMake(20, 608.5);
    leftPoints[10] = CGPointMake(50, 633.5);
    
    CGPathAddLines(leftPath, NULL, leftPoints, 11);
    
    left = [CAShapeLayer layer];
    left.path = throughPath;
    left.strokeColor = [UIColor blackColor].CGColor;
    left.fillColor = [UIColor greenColor].CGColor;
    left.lineWidth = 4;
    left.lineCap = kCALineCapRound;
    left.lineJoin = kCALineJoinRound;
    
    CGPathRelease(leftPath);
    
    [self.view.layer addSublayer:left];
    
    [NSTimer scheduledTimerWithTimeInterval:20 target:self selector:@selector(changeThrough) userInfo:nil repeats:YES];
    [NSTimer scheduledTimerWithTimeInterval:20 target:self selector:@selector(changeLeft) userInfo:nil repeats:YES];
}

// This method changes the color of through according to its traffic timing.
- (void)changeThrough {
    [self performSelector:@selector(throughYellow) withObject:nil afterDelay:12];
    [self performSelector:@selector(throughRed) withObject:nil afterDelay:14];
    [self performSelector:@selector(throughGreen) withObject:nil afterDelay:20];
}

// This method changes the color of left according to its traffic timing.
- (void)changeLeft {
    [self performSelector:@selector(leftYellow) withObject:nil afterDelay:10];
    [self performSelector:@selector(leftRed) withObject:nil afterDelay:12];
    [self performSelector:@selector(leftGreen) withObject:nil afterDelay:20];
}

// This method changes through to yellow.
- (void)throughYellow {
    through.fillColor = [UIColor yellowColor].CGColor;
}

// This method changes through to red.
- (void)throughRed {
    through.fillColor = [UIColor redColor].CGColor;
}

// This method changes through to g ssreen.
- (void)throughGreen {
    through.fillColor = [UIColor greenColor].CGColor;
}

// This method changes left to yellow.
- (void)leftYellow {
    left.fillColor = [UIColor yellowColor].CGColor;
}

// This method changes left to red.
- (void)leftRed {
    left.fillColor = [UIColor redColor].CGColor;
}

// This method changes left to green.
- (void)leftGreen {
    left.fillColor = [UIColor greenColor].CGColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
