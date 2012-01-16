//
//  Tweet.m
//  TDD
//
//  Created by KAZUMA Ukyo on 12/01/17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Tweet.h"

@implementation Tweet

@synthesize user = _user;
@synthesize text = _text;

+ (Tweet*)tweetWithJSON:(id)JSON
{
    Tweet *tweet = [[[Tweet alloc] init] autorelease];
    
    tweet.user = [[JSON objectForKey:@"user"] objectForKey:@"screen_name"];
    tweet.text = [JSON objectForKey:@"text"];
    return tweet;
}
@end
