//
//  GAIDetailViewController.m
//  Angel Ed
//
//  Created by Иван on 3/27/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

#import "GAIDetailViewController.h"
#import "Posts.h"
#import "MPTextView.h"

@interface GAIDetailViewController ()
- (void)configureView;
@end

@implementation GAIDetailViewController

@synthesize titleView;
@synthesize categoryView;
@synthesize textView;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        [Posts setCurrentKey:_detailItem];
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    NSMutableDictionary *post = [Posts getPostDataForCurrentKey];
    NSString *currentTitle = [post objectForKey:kPostTitle];
    NSString *currentCategory = [post objectForKey:kPostCategory];
    NSString *currentText = [post objectForKey:kPostText];
    
    if (![currentTitle isEqualToString:@""]) {
        self.titleView.text = currentTitle;
    }
    else {
        self.titleView.text = kDefaultTitle;
    }
    if (![currentCategory isEqualToString:@""]) {
        self.categoryView.text = currentCategory;
    }
    else {
        self.categoryView.text = kDefaultCategory;
    }
    if (![currentText isEqualToString:@""]) {
        self.textView.text = currentText;
    }
    else {
        self.textView.text = kDefaultText;
    }
    
    ((MPTextView *)titleView).placeholderText = kTitlePlaceholder;
    ((MPTextView *)categoryView).placeholderText = kCategoryPlaceholder;
    ((MPTextView *)textView).placeholderText = kTextPlaceholder;
    
    // To disable editing
    // self.titleView.editable = NO;
}

-(void)viewWillDisappear:(BOOL)animated {
    
    if (![self.textView.text isEqualToString:@""]) {
        NSString *currentTitle = kDefaultTitle;
        NSString *currentCategory = kDefaultCategory;
        if (![self.titleView.text isEqualToString:@""]) {
            currentTitle = self.titleView.text;
        }
        if (![self.categoryView.text isEqualToString:@""]) {
            currentCategory = self.categoryView.text;
        }
        [Posts setTitle:currentTitle setText:self.textView.text setCategoryforCurrentKey:currentCategory];
    }
    else {
        [Posts removePostForKey:[Posts getCurrentKey]];
    }
    
    
    [Posts savePosts];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];

    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
