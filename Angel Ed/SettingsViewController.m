//
//  SettingsViewController.m
//  Angel Ed
//
//  Created by Иван on 4/5/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@end

@implementation SettingsViewController {

NSArray *data;
}
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
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // Dummy array
    data = [NSArray arrayWithObjects:@"Block 1", @"Block 2", @"Block 3",nil];
    // NSLog(@"Checkpoint 3");
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // NSLog(@"Checkpoint 2");
    NSLog(@"data %@", data);
    return [data count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // NSLog(@"checkpoint 1");
    
    static NSString *simpleTableIdentifier = @"AboutCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    NSString *info = [data objectAtIndex:indexPath.row];
    cell.textLabel.text = info;
    return cell;
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

@end
