//
//  PostListCell.h
//  Angel Ed
//
//  Created by Иван on 4/13/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *text;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *month;

@end
