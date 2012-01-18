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
    
    id __mockResponse;
}

@property(nonatomic, readonly) NSArray *tweets;

- (void)requestPublicTimeline:(void (^)(TwitterClientResponseStatus status)) callback;
- (void)searchWithString:(NSString *)word callback:(void (^)(TwitterClientResponseStatus status))callback;
- (Tweet*)tweetForIndexPath:(NSIndexPath*)indexPath;

// テスト用のメソッド
- (void)__setMockResponse:(id)response;
- (id)__response:(id)response;


@end