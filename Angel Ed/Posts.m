//
//  Posts.m
//  Angel Ed
//
//  Created by Иван on 3/27/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

#import "Posts.h"

@implementation Posts

static NSMutableDictionary *allPosts;
static NSString *currentKey;

// Getting data
+(NSMutableDictionary *)gettAllPosts {
    
    if (allPosts == nil) {
        allPosts = [[NSMutableDictionary alloc] initWithDictionary:[[NSUserDefaults standardUserDefaults] dictionaryForKey:kAllPosts]];
    }
    return allPosts;
}

@end
