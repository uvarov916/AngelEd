//
//  PersonalInfoViewController.h
//  Angel Ed
//
//  Created by Иван on 4/26/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalInfoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *enterNameTextView;
@property (weak, nonatomic) IBOutlet UILabel *titleTextView;
- (IBAction)doneButton:(id)sender;

@end
