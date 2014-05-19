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
static NSMutableDictionary *allCategories;
static NSMutableDictionary *personalInfo;
static NSMutableDictionary *categoryRankings;
static NSString *currentKey;



+(NSMutableDictionary *)getAllRankings {
    
    if (categoryRankings == nil) {
        categoryRankings = [[NSMutableDictionary alloc] initWithDictionary:[[NSUserDefaults standardUserDefaults] dictionaryForKey:kCategoryRankings]];
    }
    
    return categoryRankings;
}

+(NSString *)getCategoryByDifficultyRanking:(NSInteger)n {
    
    if (categoryRankings == nil) {
        categoryRankings = [[NSMutableDictionary alloc] initWithDictionary:[[NSUserDefaults standardUserDefaults] dictionaryForKey:kCategoryRankings]];
    }
    
    NSMutableDictionary *temp = [[NSMutableDictionary alloc] init];
    [temp setObject:[NSNumber numberWithInt:1] forKey:kAcademicDifficulty];
    [temp setObject:[NSNumber numberWithInt:2] forKey:kProfessionalDifficulty];
    [temp setObject:[NSNumber numberWithInt:3] forKey:kNetworkingDifficulty];
    [temp setObject:[NSNumber numberWithInt:4] forKey:kCommunityDifficulty];
    
    if ([categoryRankings objectForKey:kRankingsByDifficulty] == nil) {
        [categoryRankings setObject:[[NSMutableDictionary alloc] initWithDictionary:temp] forKey:kRankingsByDifficulty];
    }
    
    NSMutableDictionary *difficulty = [categoryRankings objectForKey:kRankingsByDifficulty];
    
 
    NSInteger acad = [[difficulty objectForKey:kAcademicDifficulty] integerValue];
    NSInteger prof = [[difficulty objectForKey:kProfessionalDifficulty] integerValue];
    NSInteger net = [[difficulty objectForKey:kNetworkingDifficulty] integerValue];
    NSInteger com = [[difficulty objectForKey:kCommunityDifficulty] integerValue];
    
    if (n == acad) {
        return kCategoryAcademic;
    }
    else if (n == prof) {
        return kCategoryProfessional;
    }
    else if (n == net) {
        return kCategoryNetworking;
    }
    else if (n == com) {
        return kCategoryCommunity;
    }
    else {
        return kCategoryDefault;
    }
    
    
}

+(void)changeDifficultyRankingFrom:(NSInteger)old To:(NSInteger)new {
    
    
    NSMutableDictionary *difficulty = [categoryRankings objectForKey:kRankingsByDifficulty];
    
    NSInteger acad = [[difficulty objectForKey:kAcademicDifficulty] integerValue];
    NSInteger prof = [[difficulty objectForKey:kProfessionalDifficulty] integerValue];
    NSInteger net = [[difficulty objectForKey:kNetworkingDifficulty] integerValue];
    NSInteger com = [[difficulty objectForKey:kCommunityDifficulty] integerValue];
    
    
    if (old < new) {
        if (acad == old) acad = new; else if (acad <= new && acad > old) acad -= 1;
        if (prof == old) prof = new; else if (prof <= new && prof > old) prof -= 1;
        if (net == old) net = new; else if (net <= new && net > old) net -= 1;
        if (com == old) com = new; else if (com <= new && com > old) com -= 1;
    }
    else if (old > new) {
        if (acad == old) acad = new; else if (acad < old && acad >= new) acad += 1;
        if (prof == old) prof = new; else if (prof < old && prof >= new) prof += 1;
        if (net == old) net = new; else if (net < old && net >= new) net += 1;
        if (com == old) com = new; else if (com < old && com >= new) com += 1;
    }
    
    
    [difficulty setObject:[NSNumber numberWithInt:acad] forKey:kAcademicDifficulty];
    [difficulty setObject:[NSNumber numberWithInt:prof] forKey:kProfessionalDifficulty];
    [difficulty setObject:[NSNumber numberWithInt:net] forKey:kNetworkingDifficulty];
    [difficulty setObject:[NSNumber numberWithInt:com] forKey:kCommunityDifficulty];
    
    [categoryRankings setObject:difficulty forKey:kRankingsByDifficulty];
    [self saveRankings];
}

+(NSString *)getCategoryByInterestRanking:(NSInteger)n {
    
    if (categoryRankings == nil) {
        categoryRankings = [[NSMutableDictionary alloc] initWithDictionary:[[NSUserDefaults standardUserDefaults] dictionaryForKey:kCategoryRankings]];
    }
    
    NSMutableDictionary *temp = [[NSMutableDictionary alloc] init];
    [temp setObject:[NSNumber numberWithInt:1] forKey:kAcademicInterest];
    [temp setObject:[NSNumber numberWithInt:2] forKey:kProfessionalInterest];
    [temp setObject:[NSNumber numberWithInt:3] forKey:kNetworkingInterest];
    [temp setObject:[NSNumber numberWithInt:4] forKey:kCommunityInterest];
    
    if ([categoryRankings objectForKey:kRankingsByInterest] == nil) {
        [categoryRankings setObject:[[NSMutableDictionary alloc] initWithDictionary:temp] forKey:kRankingsByInterest];
    }
    
    NSMutableDictionary *interest = [categoryRankings objectForKey:kRankingsByInterest];
    
    
    NSInteger acad = [[interest objectForKey:kAcademicInterest] integerValue];
    NSInteger prof = [[interest objectForKey:kProfessionalInterest] integerValue];
    NSInteger net = [[interest objectForKey:kNetworkingInterest] integerValue];
    NSInteger com = [[interest objectForKey:kCommunityInterest] integerValue];
    
    if (n == acad) {
        return kCategoryAcademic;
    }
    else if (n == prof) {
        return kCategoryProfessional;
    }
    else if (n == net) {
        return kCategoryNetworking;
    }
    else if (n == com) {
        return kCategoryCommunity;
    }
    else {
        return kCategoryDefault;
    }
    
    
}

+(void)changeInterestRankingFrom:(NSInteger)old To:(NSInteger)new {
    
    
    NSMutableDictionary *interest = [categoryRankings objectForKey:kRankingsByInterest];
    
    NSInteger acad = [[interest objectForKey:kAcademicInterest] integerValue];
    NSInteger prof = [[interest objectForKey:kProfessionalInterest] integerValue];
    NSInteger net = [[interest objectForKey:kNetworkingInterest] integerValue];
    NSInteger com = [[interest objectForKey:kCommunityInterest] integerValue];
    
    
    if (old < new) {
        if (acad == old) acad = new; else if (acad <= new && acad > old) acad -= 1;
        if (prof == old) prof = new; else if (prof <= new && prof > old) prof -= 1;
        if (net == old) net = new; else if (net <= new && net > old) net -= 1;
        if (com == old) com = new; else if (com <= new && com > old) com -= 1;
    }
    else if (old > new) {
        if (acad == old) acad = new; else if (acad < old && acad >= new) acad += 1;
        if (prof == old) prof = new; else if (prof < old && prof >= new) prof += 1;
        if (net == old) net = new; else if (net < old && net >= new) net += 1;
        if (com == old) com = new; else if (com < old && com >= new) com += 1;
    }
    
    
    [interest setObject:[NSNumber numberWithInt:acad] forKey:kAcademicInterest];
    [interest setObject:[NSNumber numberWithInt:prof] forKey:kProfessionalInterest];
    [interest setObject:[NSNumber numberWithInt:net] forKey:kNetworkingInterest];
    [interest setObject:[NSNumber numberWithInt:com] forKey:kCommunityInterest];
    
    [categoryRankings setObject:interest forKey:kRankingsByInterest];
    [self saveRankings];
}

+(void)saveRankings {
    [[NSUserDefaults standardUserDefaults] setObject:categoryRankings forKey:kCategoryRankings];
}

+(void)initRankings {
    if (categoryRankings == nil) {
        categoryRankings = [[NSMutableDictionary alloc] initWithDictionary:[[NSUserDefaults standardUserDefaults] dictionaryForKey:kCategoryRankings]];
    }
    
    NSMutableDictionary *temp = [[NSMutableDictionary alloc] init];
    [temp setObject:[NSNumber numberWithInt:1] forKey:kAcademicInterest];
    [temp setObject:[NSNumber numberWithInt:2] forKey:kProfessionalInterest];
    [temp setObject:[NSNumber numberWithInt:3] forKey:kNetworkingInterest];
    [temp setObject:[NSNumber numberWithInt:4] forKey:kCommunityInterest];
    
    if ([categoryRankings objectForKey:kRankingsByInterest] == nil) {
        [categoryRankings setObject:[[NSMutableDictionary alloc] initWithDictionary:temp] forKey:kRankingsByInterest];
    }
    else if ([categoryRankings objectForKey:kRankingsByDifficulty] == nil) {
        [categoryRankings setObject:[[NSMutableDictionary alloc] initWithDictionary:temp] forKey:kRankingsByDifficulty];
    }
}

+(float)getMultiplierFromCategoryName:(NSString *)category {
    
    NSInteger difficultyRank = 0;
    NSInteger interestRank = 0;
    
    NSLog(category);
    
    if ([category isEqualToString:kCategoryAcademic]) {
        difficultyRank = [[[categoryRankings objectForKey:kRankingsByDifficulty] objectForKey:kAcademicDifficulty] integerValue];
        interestRank = [[[categoryRankings objectForKey:kRankingsByInterest] objectForKey:kAcademicInterest] integerValue];
        NSLog(@"Inside if statement");
        NSLog([[[categoryRankings objectForKey:kRankingsByDifficulty] objectForKey:kAcademicDifficulty] stringValue]);
        NSLog([[[categoryRankings objectForKey:kRankingsByInterest] objectForKey:kAcademicInterest] stringValue]);
    }
    else if ([category isEqualToString:kCategoryProfessional]) {
        difficultyRank = [[[categoryRankings objectForKey:kRankingsByDifficulty] objectForKey:kProfessionalDifficulty] integerValue];
        interestRank = [[[categoryRankings objectForKey:kRankingsByInterest] objectForKey:kProfessionalInterest] integerValue];
    }
    else if ([category isEqualToString:kCategoryNetworking]) {
        difficultyRank = [[[categoryRankings objectForKey:kRankingsByDifficulty] objectForKey:kNetworkingDifficulty] integerValue];
        interestRank = [[[categoryRankings objectForKey:kRankingsByInterest] objectForKey:kNetworkingInterest] integerValue];
    }
    else if ([category isEqualToString:kCategoryCommunity]) {
        difficultyRank = [[[categoryRankings objectForKey:kRankingsByDifficulty] objectForKey:kCommunityDifficulty] integerValue];
        interestRank = [[[categoryRankings objectForKey:kRankingsByInterest] objectForKey:kCommunityInterest] integerValue];
    }
    
    float difficultyMultiplier = 1.0;
    float interestMultiplier = 1.0;
    
    switch (difficultyRank) {
        case 1:
            difficultyMultiplier = 2.0;
            break;
        case 2:
            difficultyMultiplier = 1.75;
            break;
        case 3:
            difficultyMultiplier = 1.5;
            break;
        case 4:
            difficultyMultiplier = 1.25;
            break;
        default:
            break;
    }
    
    switch (interestRank) {
        case 1:
            interestMultiplier = 2.0;
            break;
        case 2:
            interestMultiplier = 1.75;
            break;
        case 3:
            interestMultiplier = 1.5;
            break;
        case 4:
            interestMultiplier = 1.25;
            break;
        default:
            break;
    }
    
    float result = interestMultiplier * difficultyMultiplier;
    
    // NSLog(@"%.2f", result);
    
    return result;
}


// Getting all posts dictionary
+(NSMutableDictionary *)getAllPosts {
    
    if (allPosts == nil) {
        allPosts = [[NSMutableDictionary alloc] initWithDictionary:[[NSUserDefaults standardUserDefaults] dictionaryForKey:kAllPosts]];
    }
    return allPosts;
}

// Getting all categories dictionary
+(NSMutableDictionary *)getAllCategories {
    
    if (allCategories == nil) {
        allCategories = [[NSMutableDictionary alloc] initWithDictionary:[[NSUserDefaults standardUserDefaults] dictionaryForKey:kAllCategories]];
    }
    return allCategories;
}

+(NSMutableDictionary *)getPersonalInfo {
    if (personalInfo == nil) {
        personalInfo = [[NSMutableDictionary alloc] initWithDictionary:[[NSUserDefaults standardUserDefaults] dictionaryForKey:kAllPersonalInfo]];
    }
    return personalInfo;
}

+(void)setPersonalName:(NSString *)name {
    [personalInfo setObject:name forKey:kPersonName];
    
    [[NSUserDefaults standardUserDefaults] setObject:personalInfo forKey:kAllPersonalInfo];
}

+(void)setPersonalPhoto:(NSData *)photo {
    [personalInfo setObject:photo forKey:kPersonPhoto];
    
    [[NSUserDefaults standardUserDefaults] setObject:personalInfo forKey:kAllPersonalInfo];
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
    [post setObject:[NSNumber numberWithInt:0] forKey:kPostPoints];
    
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
+(void)saveCategories {
    [[NSUserDefaults standardUserDefaults] setObject:allCategories forKey:kAllCategories];
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
        [newDictionary setObject:[NSNumber numberWithInt:0] forKey:kPostPoints];
    }
    else {
        [newDictionary setObject:text forKey:kPostText];
        float multiplier = [Posts getMultiplierFromCategoryName:category];
        int length = (int)[text length];
        int result = (int)(multiplier * length);
        NSNumber *nslength = [NSNumber numberWithInt:result];
        [newDictionary setObject:nslength forKey:kPostPoints];
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
    [Posts savePosts];
    [self countPointsForCategories];
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

+(void)setTextforCurrentKey:(NSString *)text {
    NSMutableDictionary *post = [Posts getPostDataForCurrentKey];
    NSString *currentTitle = [post objectForKey:kPostTitle];
    NSString *currentCategory = [post objectForKey:kPostCategory];
    
    [Posts setTitle:currentTitle setText:text setCategory:currentCategory forKey:currentKey];
}

+(void)setTitleforCurrentKey:(NSString *)title {
    NSMutableDictionary *post = [Posts getPostDataForCurrentKey];
    NSString *currentCategory = [post objectForKey:kPostCategory];
    NSString *currentText = [post objectForKey:kPostText];
    
    [Posts setTitle:title setText:currentText setCategory:currentCategory forKey:currentKey];
}

+(void)countPointsForCategories {
    
    // Creating dictionaries for categories
//    if([allCategories objectForKey:kCategoryAcademic] == nil) {
//        [allCategories setObject:[[NSMutableDictionary alloc] init] forKey:kCategoryAcademic];
//    }
//    if([allCategories objectForKey:kCategoryProfessional] == nil) {
//        [allCategories setObject:[[NSMutableDictionary alloc] init] forKey:kCategoryProfessional];
//    }
//    if([allCategories objectForKey:kCategoryNetworking] == nil) {
//        [allCategories setObject:[[NSMutableDictionary alloc] init] forKey:kCategoryNetworking];
//    }
//    if([allCategories objectForKey:kCategoryCommunity] == nil) {
//        [allCategories setObject:[[NSMutableDictionary alloc] init] forKey:kCategoryCommunity];
//    }
    
//    NSNumber *pointsAcademic = [NSNumber numberWithInt:0];
//    NSNumber *pointsProfessional = [NSNumber numberWithInt:0];
//    NSNumber *pointsNetworking = [NSNumber numberWithInt:0];
//    NSNumber *pointsCommunity = [NSNumber numberWithInt:0];
    
    NSInteger pointsAcademic = 0;
    NSInteger pointsProfessional = 0;
    NSInteger pointsNetworking = 0;
    NSInteger pointsCommunity = 0;
    
    
    for (id key in allPosts) {
        NSMutableDictionary *post = [Posts getPostDataForKey:key];
        NSInteger postPoints = [[post objectForKey:kPostPoints] intValue];
        NSString *postCategory = [post objectForKey:kPostCategory];
        
        if ([postCategory isEqualToString:kCategoryAcademic]) {
            pointsAcademic += postPoints;
        }
        else if ([postCategory isEqualToString:kCategoryProfessional]) {
            pointsProfessional += postPoints;
        }
        else if ([postCategory isEqualToString:kCategoryNetworking]) {
            pointsNetworking += postPoints;
        }
        else if ([postCategory isEqualToString:kCategoryCommunity]) {
            pointsCommunity += postPoints;
        }
    }
    
    
    
    [allCategories setObject:[NSNumber numberWithInteger:pointsAcademic] forKey:kCategoryAcademic];
    [allCategories setObject:[NSNumber numberWithInteger:pointsProfessional] forKey:kCategoryProfessional];
    [allCategories setObject:[NSNumber numberWithInteger:pointsNetworking] forKey:kCategoryNetworking];
    [allCategories setObject:[NSNumber numberWithInteger:pointsCommunity] forKey:kCategoryCommunity];
    
    
    [Posts saveCategories];

    // Testing code
//    NSLog(@"Academic: %i", [[[Posts getAllCategories] objectForKey:kCategoryAcademic] intValue]);
//    NSLog(@"Professional: %i", [[[Posts getAllCategories] objectForKey:kCategoryProfessional] intValue]);
//    NSLog(@"Networking: %i", [[[Posts getAllCategories] objectForKey:kCategoryNetworking] intValue]);
//    NSLog(@"Community: %i", [[[Posts getAllCategories] objectForKey:kCategoryCommunity] intValue]);
}




@end
