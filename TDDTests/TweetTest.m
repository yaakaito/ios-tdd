//
//  TweetTest.m
//  TDD
//
//  Created by KAZUMA Ukyo on 12/01/17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TweetTest.h"
#import "Tweet.h"

@implementation TweetTest

- (void)testTweetWithJSON
{
    NSDictionary *JSON = [NSDictionary dictionaryWithObjectsAndKeys:[NSDictionary dictionaryWithObjectsAndKeys:@"yaakaito", @"screen_name", nil], @"user"
                                                                    ,@"ワレワレハ、ウチュウジン", @"text", nil];
    Tweet *tweet = [Tweet tweetWithJSON:JSON];

    STAssertEqualObjects(@"yaakaito", tweet.user, @"userは yaakaito になってほしい");
    STAssertEqualObjects(@"ワレワレハ、ウチュウジン", tweet.text, @"textは ワレワレハ、ウチュウジン になってほしい");
    
}
@end
