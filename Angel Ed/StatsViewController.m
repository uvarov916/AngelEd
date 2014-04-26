//
//  StatsViewController.m
//  Angel Ed
//
//  Created by Иван on 4/24/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

#import "StatsViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "Posts.h"

#define UIColorHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface StatsViewController () {
    // NSMutableArray *markers;
    UIView *chart;
}

@end

@implementation StatsViewController

@synthesize networkingLabelDet;
@synthesize academicLabelDet;
@synthesize communityLabelDet;
@synthesize professionalLabelDet;
@synthesize totalLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [Posts countPointsForCategories];
    [self createPieChart];
    
    NSMutableDictionary *categories = [Posts getAllCategories];
    NSNumber *academicPoints = [categories objectForKey:kCategoryAcademic];
    NSNumber *communityPoints = [categories objectForKey:kCategoryCommunity];
    NSNumber *professionalPoints = [categories objectForKey:kCategoryProfessional];
    NSNumber *networkingPoints = [categories objectForKey:kCategoryNetworking];
    NSInteger totalPoints = [academicPoints integerValue] + [communityPoints integerValue] + [professionalPoints integerValue] + [networkingPoints integerValue];
    
    self.networkingLabelDet.text = [networkingPoints stringValue];
    self.communityLabelDet.text = [communityPoints stringValue];
    self.academicLabelDet.text = [academicPoints stringValue];
    self.professionalLabelDet.text = [professionalPoints stringValue];
    self.totalLabel.text = [[NSNumber numberWithInteger:totalPoints] stringValue];
    
}

-(void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel *networkingLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 375, 120, 30)];
        networkingLabel.text = @"Networking";
        networkingLabel.textColor = [UIColor darkGrayColor];
        networkingLabel.font = [UIFont systemFontOfSize:22];
        networkingLabel.textAlignment = NSTextAlignmentRight;
    
    networkingLabelDet = [[UILabel alloc] initWithFrame:CGRectMake(20, 404, 120, 21)];
        networkingLabelDet.text = @"367";
        networkingLabelDet.textColor = [UIColor lightGrayColor];
        networkingLabelDet.font = [UIFont systemFontOfSize:17];
        networkingLabelDet.textAlignment = NSTextAlignmentRight;
    
    UILabel *communityLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 441, 120, 30)];
        communityLabel.text = @"Community";
        communityLabel.textColor = [UIColor darkGrayColor];
        communityLabel.font = [UIFont systemFontOfSize:22];
        communityLabel.textAlignment = NSTextAlignmentRight;
    
    communityLabelDet = [[UILabel alloc] initWithFrame:CGRectMake(20, 470, 120, 21)];
        communityLabelDet.text = @"367";
        communityLabelDet.textColor = [UIColor lightGrayColor];
        communityLabelDet.font = [UIFont systemFontOfSize:17];
        communityLabelDet.textAlignment = NSTextAlignmentRight;
    
    UILabel *academicLabel = [[UILabel alloc] initWithFrame:CGRectMake(180, 375, 120, 30)];
        academicLabel.text = @"Academic";
        academicLabel.textColor = [UIColor darkGrayColor];
        academicLabel.font = [UIFont systemFontOfSize:22];
        academicLabel.textAlignment = NSTextAlignmentLeft;
    
    academicLabelDet = [[UILabel alloc] initWithFrame:CGRectMake(180, 404, 120, 21)];
        academicLabelDet.text = @"367";
        academicLabelDet.textColor = [UIColor lightGrayColor];
        academicLabelDet.font = [UIFont systemFontOfSize:17];
        academicLabelDet.textAlignment = NSTextAlignmentLeft;
    
    UILabel *professionalLabel = [[UILabel alloc] initWithFrame:CGRectMake(180, 441, 120, 30)];
        professionalLabel.text = @"Professional";
        professionalLabel.textColor = [UIColor darkGrayColor];
        professionalLabel.font = [UIFont systemFontOfSize:22];
        professionalLabel.textAlignment = NSTextAlignmentLeft;
    
    professionalLabelDet = [[UILabel alloc] initWithFrame:CGRectMake(180, 470, 120, 21)];
        professionalLabelDet.text = @"367";
        professionalLabelDet.textColor = [UIColor lightGrayColor];
        professionalLabelDet.font = [UIFont systemFontOfSize:17];
        professionalLabelDet.textAlignment = NSTextAlignmentLeft;
    
    
    UIView *networkingRect = [[UIView alloc] initWithFrame:CGRectMake(148, 375, 4, 50)];
    networkingRect.backgroundColor = [self color:2];
    [self.view addSubview:networkingRect];
    
    UIView *academicRect = [[UIView alloc] initWithFrame:CGRectMake(168, 375, 4, 50)];
    academicRect.backgroundColor = [self color:0];
    [self.view addSubview:academicRect];
    
    UIView *communityRect = [[UIView alloc] initWithFrame:CGRectMake(148, 441, 4, 50)];
    communityRect.backgroundColor = [self color:3];
    [self.view addSubview:communityRect];
    
    UIView *professionalRect = [[UIView alloc] initWithFrame:CGRectMake(168, 441, 4, 50)];
    professionalRect.backgroundColor = [self color:1];
    [self.view addSubview:professionalRect];
    
    [self.view addSubview:networkingLabel];
    [self.view addSubview:communityLabel];
    [self.view addSubview:academicLabel];
    [self.view addSubview:professionalLabel];
    
    [self.view addSubview:networkingLabelDet];
    [self.view addSubview:communityLabelDet];
    [self.view addSubview:academicLabelDet];
    [self.view addSubview:professionalLabelDet];
    
    
    totalLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 304, 280, 27)];
        totalLabel.text = @"1754";
        totalLabel.textColor = [UIColor darkGrayColor];
        totalLabel.font = [UIFont systemFontOfSize:23];
        totalLabel.textAlignment = NSTextAlignmentCenter;
    
    UILabel *totalLabelDet = [[UILabel alloc] initWithFrame:CGRectMake(20, 339, 280, 21)];
        totalLabelDet.text = @"points";
        totalLabelDet.textColor = [UIColor lightGrayColor];
        totalLabelDet.font = [UIFont systemFontOfSize:17];
        totalLabelDet.textAlignment = NSTextAlignmentCenter;
    
    
    UIView *totalNetworkingRect = [[UIView alloc] initWithFrame:CGRectMake(80, 333, 40, 4)];
    totalNetworkingRect.backgroundColor = [self color:2];
    [self.view addSubview:totalNetworkingRect];
    
    UIView *totalAcademicRect = [[UIView alloc] initWithFrame:CGRectMake(120, 333, 40, 4)];
    totalAcademicRect.backgroundColor = [self color:0];
    [self.view addSubview:totalAcademicRect];
    
    UIView *totalCommunityRect = [[UIView alloc] initWithFrame:CGRectMake(160, 333, 40, 4)];
    totalCommunityRect.backgroundColor = [self color:3];
    [self.view addSubview:totalCommunityRect];
    
    UIView *totalProfessionalRect = [[UIView alloc] initWithFrame:CGRectMake(200, 333, 40, 4)];
    totalProfessionalRect.backgroundColor = [self color:1];
    [self.view addSubview:totalProfessionalRect];
    
    
    [self.view addSubview:totalLabel];
    [self.view addSubview:totalLabelDet];
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
            // red
            return UIColorHex(0xE54EAB);
        case 1:
            // blue
            return UIColorHex(0x2751AE);
        case 2:
            // green
            return UIColorHex(0x4AB14E);
        case 3:
            // orange
            return UIColorHex(0xFACB09);
        case 4:
            // white
            return UIColorHex(0xFFFFFF)/*UIColorHex(0xE9F2DF)*/;
        default:
            break;
    }
    return nil;
}

- (void)createPieChart
{
    chart = [[UIView alloc] initWithFrame:CGRectMake(60, 80, 200, 200)];
    chart.backgroundColor = [UIColor blackColor];
    chart.layer.cornerRadius = 100;
    [self.view addSubview:chart];
    
    
    // Getting points data
    NSMutableDictionary *categories = [Posts getAllCategories];
    NSInteger pointsAcademic = [[categories objectForKey:kCategoryAcademic] integerValue];
    NSInteger pointsProfessional = [[categories objectForKey:kCategoryProfessional] integerValue];
    NSInteger pointsNetworking = [[categories objectForKey:kCategoryNetworking] integerValue];
    NSInteger pointsCommunity = [[categories objectForKey:kCategoryCommunity] integerValue];
    
    float red = pointsAcademic;
    float blue = pointsProfessional;
    float green = pointsNetworking;
    float orange = pointsCommunity;
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
        sl.strokeColor = [self color:i].CGColor;
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
