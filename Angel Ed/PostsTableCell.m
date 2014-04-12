//
//  PostsTableCell.m
//  Angel Ed
//
//  Created by Иван on 4/12/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

#import "PostsTableCell.h"

@implementation PostsTableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
