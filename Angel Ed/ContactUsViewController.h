//
//  ContactUsViewController.h
//  Angel Ed
//
//  Created by Иван on 4/26/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface ContactUsViewController : UIViewController <MFMailComposeViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *emailButton;
- (IBAction)clickEmailButton:(id)sender;

@end