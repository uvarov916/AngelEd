//
//  editTitleViewController.m
//  Angel Ed
//
//  Created by Иван on 4/23/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

#import "editTitleViewController.h"
#import "Posts.h"
#import "MPTextView.h"

@interface editTitleViewController ()

@end

@implementation editTitleViewController

@synthesize titleView;

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
    ((MPTextView *)titleView).placeholderText = kTitlePlaceholder;
    [self.btnChooseCategory setTitleColor:[UIColor colorWithRed:0.212 green:0.631 blue:0.831 alpha:1.0] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    
    NSMutableDictionary *post = [Posts getPostDataForCurrentKey];
    NSString *currentTitle = [post objectForKey:kPostTitle];
    NSString *currentCategory = [post objectForKey:kPostCategory];
    
    self.categoryLabel.text = currentCategory;
    self.titleView.text = currentTitle;
    
    [self.titleView becomeFirstResponder];
}

-(void)saveData {
    NSString *currentTitle = kDefaultTitle;
    if (![self.titleView.text isEqualToString:@""]) {
        currentTitle = self.titleView.text;
    }
    [Posts setTitleforCurrentKey:currentTitle];
    
    [Posts savePosts];
}

-(void)viewWillDisappear:(BOOL)animated {
    [self saveData];
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

- (IBAction)btnDone:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
