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
@synthesize pointsTextView;

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


//-(void)customBtnPressed {
//    
//    [self saveData];
//    [self.view endEditing:YES];
//    
//}

- (void)configureView
{
    
    NSMutableDictionary *post = [Posts getPostDataForCurrentKey];
    NSString *currentTitle = [post objectForKey:kPostTitle];
    NSString *currentText = [post objectForKey:kPostText];
    NSString *currentCategory = [post objectForKey:kPostCategory];
    NSString *currentPoints = [[post objectForKey:kPostPoints] stringValue];
    
    if (![currentTitle isEqualToString:@""]) {
        self.titleView.text = currentTitle;
    }
    else {
        self.titleView.text = kDefaultTitle;
    }
    if (![currentCategory isEqualToString:@""]) {
        self.categoryView.text = [currentCategory capitalizedString];
    }
    else {
        self.categoryView.text = [kDefaultCategory capitalizedString];
    }
    if (![currentText isEqualToString:@""]) {
        self.textView.text = currentText;
    }
    else {
        self.textView.text = kDefaultText;
    }
    
    // Changing points label
    self.pointsTextView.text = [currentPoints stringByAppendingString:@" points"];
    
    
    //((MPTextView *)titleView).placeholderText = kTitlePlaceholder;
    //((MPTextView *)categoryView).placeholderText = kCategoryPlaceholder;
    //((MPTextView *)textView).placeholderText = kTextPlaceholder;
    
    // To disable editing
//    self.categoryView.editable = NO;
//    self.textView.editable = NO;
//    self.titleView.editable = NO;
    
    
//    UIBarButtonItem *customBtn=[[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(customBtnPressed)];
//    [self.navigationItem setRightBarButtonItem:customBtn];
    
    
    self.textView.layoutManager.delegate = self;
}

- (CGFloat)layoutManager:(NSLayoutManager *)layoutManager lineSpacingAfterGlyphAtIndex:(NSUInteger)glyphIndex withProposedLineFragmentRect:(CGRect)rect
{
    return 5; // For really wide spacing; pick your own value
}

-(void)viewWillAppear:(BOOL)animated {
    [self configureView];
    
    
    // Resizing textView
    CGRect rect = self.textView.frame;
    rect.size.height = self.textView.contentSize.height;
    self.textView.frame = rect;
    [self.textView sizeToFit];
    
    
    float fscrview = textView.frame.origin.y + textView.frame.size.height + 20;
    self.postScrollView.contentSize=CGSizeMake(320, fscrview);
}

-(void)viewWillDisappear:(BOOL)animated {
    
    if ([self.titleView.text isEqualToString:@""] && [self.textView.text isEqualToString:@""]) {
        [Posts removePostForKey:[Posts getCurrentKey]];
    }
}

//-(void)saveData {
//    NSString *currentTitle = kDefaultTitle;
//    NSString *currentCategory = kDefaultCategory;
//    NSString *currentText = kDefaultText;
//    if (![self.titleView.text isEqualToString:@""]) {
//        currentTitle = self.titleView.text;
//    }
//    if (![self.categoryView.text isEqualToString:@""]) {
//        currentCategory = self.categoryView.text;
//    }
//    if (![self.textView.text isEqualToString:@""]) {
//        currentText = self.textView.text;
//    }
//    [Posts setTitle:currentTitle setText:self.textView.text setCategoryforCurrentKey:currentCategory];
//    
//    
//    [Posts savePosts];
//}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    
    // self.automaticallyAdjustsScrollViewInsets = NO;
    NSMutableDictionary *post = [Posts getPostDataForCurrentKey];
    NSString *currentTitle = [post objectForKey:kPostTitle];
    NSString *currentText = [post objectForKey:kPostText];
    
    if ([currentTitle isEqualToString:kDefaultTitle] && [currentText isEqualToString:kDefaultText]) {
        NSLog(@"Here");
        [self performSegueWithIdentifier:@"Edit" sender:self];
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
