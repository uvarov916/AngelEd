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


-(void)customBtnPressed {
    
    [self saveData];
    [self.view endEditing:YES];
    
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
    self.categoryView.editable = NO;
    
    UIBarButtonItem *customBtn=[[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(customBtnPressed)];
    [self.navigationItem setRightBarButtonItem:customBtn];
}

-(void)viewWillAppear:(BOOL)animated {
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
}

-(void)viewWillDisappear:(BOOL)animated {
    
    [self saveData];
}

-(void)saveData {
    NSString *currentTitle = kDefaultTitle;
    NSString *currentCategory = kDefaultCategory;
    NSString *currentText = kDefaultText;
    if (![self.titleView.text isEqualToString:@""]) {
        currentTitle = self.titleView.text;
    }
    if (![self.categoryView.text isEqualToString:@""]) {
        currentCategory = self.categoryView.text;
    }
    if (![self.textView.text isEqualToString:@""]) {
        currentText = self.textView.text;
    }
    [Posts setTitle:currentTitle setText:self.textView.text setCategoryforCurrentKey:currentCategory];
    
    
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
