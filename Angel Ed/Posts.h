//
//  Posts.h
//  Angel Ed
//
//  Created by Иван on 3/27/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kDefaultText @"New Post"
#define kAllPosts @"posts"
#define kDetailView @"showDetail"

@interface Posts : NSObject

// Getting data
+(NSMutableDictionary *)gettAllPosts;

// Current key
+(void)setCurrentKey:(NSString *)key;
+(NSString *)getCurrentKey;

// Setting text, title and category
+(void)setTextForCurrentKey:(NSString *)note;
+(void)setTitleForCurrentKey:(NSString *)title;
+(void)setCategoryForCurrentKey:(NSString *)category;
+(void)setText:(NSString *)note forKey:(NSString *)key;
+(void)setCategory:(NSString *)category forKey:(NSString *)key;
+(void)setTitle:(NSString *)title forKey:(NSString *)key;

// Removing posts
+(void)removePostForKey:(NSString *)key;

// Savind data to user defaults
+(void)savePosts;

@end
