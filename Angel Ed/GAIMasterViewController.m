//
//  GAIMasterViewController.m
//  Angel Ed
//
//  Created by Иван on 3/27/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

#import "GAIMasterViewController.h"

#import "GAIDetailViewController.h"
#import "Posts.h"
#import "PostListCell.h"

@interface GAIMasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation GAIMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}


-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    
    if (!(self.selectedButton == nil)) {
        
        // Testing code that alerts identifier of clicked button
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Button was clicked" message:[self.selectedButton stringValue] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK",nil];
//        [alert show];
        
        
        self.navigationItem.leftBarButtonItem = nil;
        self.navigationItem.rightBarButtonItem = nil;
        [self makeObjectsWithData:self.selectedButton];
        
    }
    else {
        [self makeObjects];
    }
    
    [self.tableView reloadData];
    
    [self updateBackground];
}

-(void)updateBackground {
    int sections = [self.tableView numberOfSections];
    BOOL hasRows = NO;
    for (int i = 0; i < sections; i++)
        hasRows = ([self.tableView numberOfRowsInSection:i] > 0) ? YES : NO;
    
    if (sections == 0 || hasRows == NO)
    {
        UIImage *image = [UIImage imageNamed:@"emptyTableView"];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        
        // Add image view on top of table view
        [self.tableView addSubview:imageView];
        
        // Set the background view of the table view
        self.tableView.backgroundView = imageView;
    }
    else {
        self.tableView.backgroundView = nil;
    }
}

-(void)makeObjectsWithData:(NSNumber *)num {
    
    _objects = [NSMutableArray arrayWithArray:[[Posts getAllPosts] allKeys]];
    NSDictionary *posts = [Posts getAllPosts];
    
    NSMutableIndexSet *indexesToDelete = [NSMutableIndexSet indexSet];
    NSUInteger currentIndex = 0;
    
    NSString *strToCmp = kCategoryDefault;
    
    switch ([num integerValue]) {
        case 1:
            strToCmp = kCategoryNetworking;
            break;
        case 2:
            strToCmp = kCategoryAcademic;
            break;
        case 3:
            strToCmp = kCategoryCommunity;
            break;
        case 4:
            strToCmp = kCategoryProfessional;
            break;
        default:
            break;
    }
    
    for (id key in _objects) {
  
        if (!([[[posts objectForKey:key] objectForKey:kPostCategory] isEqualToString:strToCmp])) {
            [indexesToDelete addIndex:currentIndex];
        }
        currentIndex++;
    }
    
    [_objects removeObjectsAtIndexes:indexesToDelete];
    [_objects sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [(NSDate *)obj2 compare:(NSDate *)obj1];
    }];

}

-(void)makeObjects {
    
    _objects = [NSMutableArray arrayWithArray:[[Posts getAllPosts] allKeys]];
    [_objects sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [(NSDate *)obj2 compare:(NSDate *)obj1];
    }];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    [self makeObjects];

    NSString *key = [[NSDate date] description];
    [Posts setTitle:kDefaultTitle setText:kDefaultText setCategory:kDefaultCategory forKey:key];
    [Posts setCurrentKey:key];
    [_objects insertObject:key atIndex:0];

    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [self performSegueWithIdentifier:kDetailView sender:self];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostListCell" forIndexPath:indexPath];
    PostListCell *postListCell = (PostListCell *)cell;
    NSDate *object = _objects[indexPath.row];
    postListCell.title.text = [[[Posts getAllPosts] objectForKey:[object description]] objectForKey:kPostTitle ];
    postListCell.text.text = [[[Posts getAllPosts] objectForKey:[object description]] objectForKey:kPostText ];
    postListCell.month.text = [[[Posts getAllPosts] objectForKey:[object description]] objectForKey:kPostMonth ];
    postListCell.date.text = [[[Posts getAllPosts] objectForKey:[object description]] objectForKey:kPostDate ];
    postListCell.time.text = [[[Posts getAllPosts] objectForKey:[object description]] objectForKey:kPostTime ];
    
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [Posts removePostForKey:[_objects objectAtIndex:indexPath.row]];
        [Posts savePosts];
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self updateBackground];
        [Posts countPointsForCategories];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = _objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

@end
