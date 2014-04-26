//
//  StatsViewController.h
//  Angel Ed
//
//  Created by Иван on 4/24/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatsViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *networkingLabelDet;
@property (strong, nonatomic) IBOutlet UILabel *communityLabelDet;
@property (strong, nonatomic) IBOutlet UILabel *academicLabelDet;
@property (strong, nonatomic) IBOutlet UILabel *professionalLabelDet;
@property (strong, nonatomic) IBOutlet UILabel *totalLabel;

@end
