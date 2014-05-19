//
//  DifficultyRankingTableViewController.m
//  Angel Ed
//
//  Created by Иван on 5/15/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

#import "DifficultyRankingTableViewController.h"
#import "Posts.h"

@interface DifficultyRankingTableViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation DifficultyRankingTableViewController

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

    cell.textLabel.text = [[Posts getCategoryByDifficultyRanking:(indexPath.row + 1)] capitalizedString];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"The most difficult";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return @"THE LEAST DIFFICULT";
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.difficultyTableView setEditing:YES animated:NO];
    
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
    
    [Posts changeDifficultyRankingFrom:(sourceIndexPath.row + 1) To:(destinationIndexPath.row + 1)];
    
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleNone;
}

- (IBAction)doneButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
