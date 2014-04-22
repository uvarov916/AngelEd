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

// Getting all posts dictionary
+(NSMutableDictionary *)getAllPosts {
    
    if (allPosts == nil) {
        allPosts = [[NSMutableDictionary alloc] initWithDictionary:[[NSUserDefaults standardUserDefaults] dictionaryForKey:kAllPosts]];
    }
    return allPosts;
}







// Getting a dictionary for a specific post
+(NSMutableDictionary *)getPostDataForKey:(NSString *)key {
    
    if (allPosts == nil) {
        allPosts = [[NSMutableDictionary alloc] initWithDictionary:[[NSUserDefaults standardUserDefaults] dictionaryForKey:kAllPosts]];
    }
    
    NSMutableDictionary *post;
    [post setObject:kDefaultTitle forKey:kPostTitle];
    [post setObject:kDefaultCategory forKey:kPostCategory];
    [post setObject:kDefaultText forKey:kPostText];
    
    // Setting up post time
    [post setObject:kDefaultDate forKey:kPostDate];
    [post setObject:kDefaultMonth forKey:kPostMonth];
    [post setObject:kDefaultTime forKey:kPostTime];
    
    if ([allPosts objectForKey:key] == nil) {
        [allPosts setObject:[[NSMutableDictionary alloc] initWithDictionary:post] forKey:key];
    }
    
    return [allPosts objectForKey:key];
}
+(NSMutableDictionary *)getPostDataForCurrentKey {
    return [Posts getPostDataForKey:currentKey];
}





// Current key
+(void)setCurrentKey:(NSString *)key {
    currentKey = key;
}
+(NSString *)getCurrentKey {
    return currentKey;
}





// Removing posts
+(void)removePostForKey:(NSString *)key {
    [allPosts removeObjectForKey:key];
}
// Savind data to user defaults
+(void)savePosts {
    [[NSUserDefaults standardUserDefaults] setObject:allPosts forKey:kAllPosts];
}


+(NSString *)convertMonthToText:(NSString *)num {
    
    if ([num isEqualToString:@"01"]) {
        return @"Jan";
    }
    else if ([num isEqualToString:@"02"]) {
        return @"Feb";
    }
    else if ([num isEqualToString:@"03"]) {
        return @"Mar";
    }
    else if ([num isEqualToString:@"04"]) {
        return @"Apr";
    }
    else if ([num isEqualToString:@"05"]) {
        return @"May";
    }
    else if ([num isEqualToString:@"06"]) {
        return @"Jun";
    }
    else if ([num isEqualToString:@"07"]) {
        return @"Jul";
    }
    else if ([num isEqualToString:@"08"]) {
        return @"Aug";
    }
    else if ([num isEqualToString:@"09"]) {
        return @"Sep";
    }
    else if ([num isEqualToString:@"10"]) {
        return @"Oct";
    }
    else if ([num isEqualToString:@"11"]) {
        return @"Nov";
    }
    else if ([num isEqualToString:@"12"]) {
        return @"Dec";
    }
    else {
        return @"None";
    }
}


+(void)setTitle:(NSString *)title setText:(NSString *)text setCategory:(NSString *)category forKey:(NSString *)key {
    
    if ([allPosts objectForKey:key] == nil) {
        [allPosts setObject:[[NSMutableDictionary alloc] init] forKey:key];
    }
    
    NSMutableDictionary *newDictionary = [allPosts objectForKey:key];
    if (title == nil) {
        [newDictionary setObject:kDefaultTitle forKey:kPostTitle];
    }
    else {
        [newDictionary setObject:title forKey:kPostTitle];
    }
    
    if (text == nil) {
        [newDictionary setObject:kDefaultText forKey:kPostText];
    }
    else {
        [newDictionary setObject:text forKey:kPostText];
    }
    
    if (category == nil) {
        [newDictionary setObject:kDefaultCategory forKey:kPostCategory];
    }
    else {
        [newDictionary setObject:category forKey:kPostCategory];
    }
    
    NSLog(@"Post time: %@", [newDictionary objectForKey:kPostTime]);
    
    // Some new code
    if ([newDictionary objectForKey:kPostTime] == nil) {
        
        NSLog(@"Inside if statement");
        NSDate *now = [NSDate date];
        NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
        NSString *newDateString;
        NSString *newTimeString;
        NSString *newMonthString;
        
        // Creating time string
        [outputFormatter setDateFormat:@"HH:mm"];
        newTimeString = [outputFormatter stringFromDate:now];
        NSLog(@"newTimeString %@", newTimeString);
        
        // Creating date string
        [outputFormatter setDateFormat:@"dd"];
        newDateString = [outputFormatter stringFromDate:now];
        NSLog(@"newDateString %@", newDateString);
        
        // Creating month string
        [outputFormatter setDateFormat:@"MM"];
        newMonthString = [Posts convertMonthToText:[outputFormatter stringFromDate:now] ];
        NSLog(@"newMonthString %@", newMonthString);
        
        
        [newDictionary setObject:newDateString forKey:kPostDate];
        [newDictionary setObject:newMonthString forKey:kPostMonth];
        [newDictionary setObject:newTimeString forKey:kPostTime];
    }
    
    [allPosts setObject:newDictionary forKey:key];
}

+(void)setTitle:(NSString *)title setText:(NSString *)text setCategoryforCurrentKey:(NSString *)category {
    [Posts setTitle:title setText:text setCategory:category forKey:currentKey];
}

+(void)setCategoryforCurrentKey:(NSString *)category {
    NSMutableDictionary *post = [Posts getPostDataForCurrentKey];
    NSString *currentTitle = [post objectForKey:kPostTitle];
    NSString *currentText = [post objectForKey:kPostText];
    
    [Posts setTitle:currentTitle setText:currentText setCategory:category forKey:currentKey];
}


@end
