//
//  Posts.h
//  Angel Ed
//
//  Created by Иван on 3/27/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kDefaultText @"New Post"
#define kDefaultTitle @"Title"
#define kDefaultCategory @"Unassigned"

#define kAllPosts @"posts"

#define kPostCategory @"category"
#define kPostTitle @"title"
#define kPostText @"text"

#define kCategoryCommunity @"community"
#define kCategoryNetworking  @"networking"
#define kCategoryProfessional @"professional"
#define kCategoryAcademic @"academic"

#define kDetailView @"showDetail"

@interface Posts : NSObject

// Getting data
+(NSMutableDictionary *)getAllPosts;

+(NSMutableDictionary *)getPostDataForKey:(NSString *)key;
+(NSMutableDictionary *)getPostDataForCurrentKey;

// Removing posts
+(void)removePostForKey:(NSString *)key;
// Savind data to user defaults
+(void)savePosts;

// Current key
+(void)setCurrentKey:(NSString *)key;
+(NSString *)getCurrentKey;

//// Setting text, title and category
//+(void)setTextForCurrentKey:(NSString *)text;
//+(void)setTitleForCurrentKey:(NSString *)title;
//+(void)setCategoryForCurrentKey:(NSString *)category;
//+(void)setText:(NSString *)text forKey:(NSString *)key;
//+(void)setCategory:(NSString *)category forKey:(NSString *)key;
//+(void)setTitle:(NSString *)title forKey:(NSString *)key;

+(void)setTitle:(NSString *)title setText:(NSString *)text setCategory:(NSString *)category forKey:(NSString *)key;
+(void)setTitle:(NSString *)title setText:(NSString *)text setCategoryforCurrentKey:(NSString *)category;


@end
