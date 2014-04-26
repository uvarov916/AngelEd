//
//  ContactUsViewController.m
//  Angel Ed
//
//  Created by Иван on 4/26/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

#import "ContactUsViewController.h"

@interface ContactUsViewController ()

@end

@implementation ContactUsViewController

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
    
    [self.emailButton setTitleColor:[UIColor colorWithRed:0.212 green:0.631 blue:0.831 alpha:1.0] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)clickEmailButton:(id)sender {
    // Email Subject
    NSString *emailTitle = @"Test Email";
    // Email Content
    NSString *messageBody = @"iOS programming is so fun!";
    // To address
    NSArray *toRecipents = [NSArray arrayWithObject:@"contact@angel-ed.org"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipents];
    
    
    // Present mail view controller on screen
    // [self presentViewController:mc animated:YES completion:NULL];
    
    // Present the email controller.  The delegate will dismiss it.
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 50000
    float systemVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (systemVersion < 7.0f) {
        [self presentViewController:mc animated:YES completion:^{}];
    }
    else {
        // Need a song and dance to get the header bar to show correctly.  (And presentModalViewController is deprecated anyway.)  Note that this code doesn't actually change the email controller's header, but it somehow lets the header below "show through" when it wouldn't otherwise.  (I know -- like many of the iOS 7 fixes this makes no sense.  But it works.  (So far.))
#warning Sometimes produces console message "Presenting view controllers on detached view controllers is discouraged <XxxxViewController: 0xc658a70>"
        [self presentViewController:mc animated:YES completion:^{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
            if (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7)
                && [[UIApplication sharedApplication] respondsToSelector:NSSelectorFromString(@"setStatusBarStyle:")]) {
                [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
            }
#endif
        }];
    }
    
#else
    [viewController presentModalViewController:emailController animated:YES];
#endif
}
@end
