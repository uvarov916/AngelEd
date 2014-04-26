//
//  editTextViewController.m
//  Angel Ed
//
//  Created by Иван on 4/23/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

#import "editTextViewController.h"
#import "Posts.h"
#import "MPTextView.h"

@interface editTextViewController ()
- (void)configureView;
@end

@implementation editTextViewController

@synthesize postView;

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
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {

    [self configureView];
    [self.postView becomeFirstResponder];
}

-(void)viewWillDisappear:(BOOL)animated {
    
}

- (void)configureView {
    
    NSMutableDictionary *post = [Posts getPostDataForCurrentKey];
    NSString *currentText = [post objectForKey:kPostText];
    
    self.postView.text = currentText;
    
    ((MPTextView *)postView).placeholderText = kTextPlaceholder;
}


-(void)saveData {
    NSString *currentText = kDefaultText;
    if (![self.postView.text isEqualToString:@""]) {
        currentText = self.postView.text;
    }
    [Posts setTextforCurrentKey:currentText];
    
    // Getting number of characters in a text
//    int length = (int)[currentText length];
//    NSLog(@"%i", length);
    
    [Posts savePosts];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    [self saveData];
}

- (IBAction)btnCancel:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
