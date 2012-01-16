//
//  TwitterClient.h
//  TDD
//
//  Created by KAZUMA Ukyo on 12/01/17.
//  Copyright (c) 2012年 yaakaito.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tweet.h"

typedef enum {
    TwitterClientResponseStatusSuccess
    , TwitterClientResponseStatusFail
} TwitterClientResponseStatus;


@interface TwitterClient : NSObject
{
    NSMutableArray *_tweets;
}

@property(nonatomic, readonly) NSArray *tweets;

- (void)requestPublicTimeline:(void (^)(TwitterClientResponseStatus status)) callback;
- (void)searchWithString:(NSString*)word callback:(void (^)())callback;
- (Tweet*)tweetForIndexPath:(NSIndexPath*)indexPath;

@end
