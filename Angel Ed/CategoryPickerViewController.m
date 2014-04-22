//
//  CategoryPickerViewController.m
//  Angel Ed
//
//  Created by Иван on 4/22/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

#import "CategoryPickerViewController.h"
#import "Posts.h"

@interface CategoryPickerViewController ()

@end

@implementation CategoryPickerViewController

-(void)refresh {
    
    NSMutableDictionary *post = [Posts getPostDataForCurrentKey];
    NSString *currentCategory = [post objectForKey:kPostCategory];
    
    for (int i = 0; i < 5; i++) {
        UITableViewCell *cell = [self tableView:self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    int currentCat = 0;
    if ([currentCategory isEqualToString:kCategoryCommunity]) {
        currentCat = 1;
    }
    else if ([currentCategory isEqualToString:kCategoryProfessional]) {
        currentCat = 2;
    }
    else if ([currentCategory isEqualToString:kCategoryAcademic]) {
        currentCat = 3;
    }
    else if ([currentCategory isEqualToString:kCategoryNetworking]) {
        currentCat = 4;
    }
    
    UITableViewCell *cell = [self tableView:self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:currentCat inSection:0]];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self refresh];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *newCat = kCategoryDefault;
    switch (indexPath.row) {
        case 1: newCat = kCategoryCommunity;
            break;
        case 2: newCat = kCategoryProfessional;
            break;
        case 3: newCat = kCategoryAcademic;
            break;
        case 4: newCat = kCategoryNetworking;
            break;
    }
    
    [Posts setCategoryforCurrentKey:newCat];
    
    // Testing code
//    NSMutableDictionary *post = [Posts getPostDataForCurrentKey];
//    NSString *currentCategory = [post objectForKey:kPostCategory];
//    NSLog(@"Current category:");
//    NSLog(currentCategory);
    
    [self refresh];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
