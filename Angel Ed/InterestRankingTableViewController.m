//
//  InterestRankingTableViewController.m
//  Angel Ed
//
//  Created by Иван on 5/15/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

#import "InterestRankingTableViewController.h"
#import "Posts.h"

@interface InterestRankingTableViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation InterestRankingTableViewController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSInteger tmp = 1;
    return tmp;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger tmp = 4;
    return tmp;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DefaultCell" forIndexPath:indexPath];
    
    cell.textLabel.text = [[Posts getCategoryByInterestRanking:(indexPath.row + 1)] capitalizedString];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"The most interesting";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return @"THE LEAST INTERESTING";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.interestTableView setEditing:YES animated:NO];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    
    [Posts changeInterestRankingFrom:(sourceIndexPath.row + 1) To:(destinationIndexPath.row + 1)];
    
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleNone;
}

@end
