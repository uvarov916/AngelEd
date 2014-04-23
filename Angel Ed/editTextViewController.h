//
//  editTextViewController.h
//  Angel Ed
//
//  Created by Иван on 4/23/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface editTextViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *postView;
- (IBAction)btnCancel:(id)sender;

@end
