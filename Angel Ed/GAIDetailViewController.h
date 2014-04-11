//
//  GAIDetailViewController.h
//  Angel Ed
//
//  Created by Иван on 3/27/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GAIDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UITextView *titleView;
@property (weak, nonatomic) IBOutlet UITextView *categoryView;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
