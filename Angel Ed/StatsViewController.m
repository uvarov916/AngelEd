//
//  StatsViewController.m
//  Angel Ed
//
//  Created by Иван on 4/24/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

#import "StatsViewController.h"
#import <QuartzCore/QuartzCore.h>

#define UIColorHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface StatsViewController () {
    // NSMutableArray *markers;
    UIView *chart;
}

@end

@implementation StatsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createPieChart];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIColor*)color:(int)i
{
    switch (i) {
        case 0:
            return UIColorHex(0xF24495);
        case 1:
            return UIColorHex(0x04BFBF);
        case 2:
            return UIColorHex(0xB2F252);
        case 3:
            return UIColorHex(0xF2CB05);
        case 4:
            return UIColorHex(0xFFFFFF)/*UIColorHex(0xE9F2DF)*/;
        default:
            break;
    }
    return nil;
}

- (void)createPieChart
{
    chart = [[UIView alloc] initWithFrame:CGRectMake(60, 100, 200, 200)];
    chart.backgroundColor = [UIColor blackColor];
    chart.layer.cornerRadius = 100;
    [self.view addSubview:chart];
    
    float red = 100;
    float blue = 50;
    float green = 50;
    float orange = 50;
    float total = red + blue + green + orange;
    
    if (total != 0) {
        red = red / total * 2 * M_PI;
        blue = blue / total * 2 * M_PI;
        green = green / total * 2 * M_PI;
        orange = orange / total * 2 * M_PI;
    } else {
        red = M_PI / 2.0;
        blue = M_PI / 2.0;
        green = M_PI / 2.0;
        orange = M_PI / 2.0;
    }
    
    float ratios[] = {red, blue, green, orange};
    float start = 0;
    for (int i=0; i<4; i++) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        float end = start + ratios[i];
        [path moveToPoint:CGPointMake(100, 100)];
        [path addArcWithCenter:CGPointMake(100, 100) radius:100 startAngle:start - M_PI/2.0 endAngle:end - M_PI/2.0 clockwise:YES];
        CAShapeLayer *sl = [[CAShapeLayer alloc] init];
        sl.fillColor = [self color:i].CGColor;
        sl.path = path.CGPath;
        [chart.layer addSublayer:sl];
        
        start = end;
    }
    
    UIView *mask = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    mask.layer.cornerRadius = 25;
    mask.center = CGPointMake(100, 100);
    mask.backgroundColor = [self color:4];
    [chart addSubview:mask];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end