//
//  editTitleViewController.h
//  Angel Ed
//
//  Created by Иван on 4/23/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface editTitleViewController : UIViewController
- (IBAction)btnDone:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *titleView;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UIButton *btnChooseCategory;

@end
