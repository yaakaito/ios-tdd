//
//  TwitterClientTest.m
//  TDD
//
//  Created by KAZUMA Ukyo on 12/01/17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TwitterClientTest.h"
#import "TwitterClient.h"

@implementation TwitterClientTest

- (void)testRequestPublicTimeline
{
    TwitterClient *client = [[TwitterClient alloc] init];

    __block BOOL calledBack = NO;
    
    [client requestPublicTimeline:^(TwitterClientResponseStatus status) {

        calledBack = YES;
    }];
    
    NSDate *loopUntil = [NSDate dateWithTimeIntervalSinceNow:10];
    while (calledBack == NO && [loopUntil timeIntervalSinceNow] > 0) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                                 beforeDate:loopUntil];
    }
    
    STAssertEquals(20U, [[client tweets] count], @"20件取得するはずなのでcountが20になってほしい");
    
    [client release];
}

- (void)testSearchWithWord
{
    TwitterClient *client = [[TwitterClient alloc] init];
    
    __block BOOL calledBack = NO;
    
    [client searchWithString:@"yaakaito" callback:^{
        calledBack = YES;
    }];
    
    NSDate *loopUntil = [NSDate dateWithTimeIntervalSinceNow:10];
    while (calledBack == NO && [loopUntil timeIntervalSinceNow] > 0) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                                 beforeDate:loopUntil];
    }
    
    STAssertTrue([[client tweets] count] <= 20, @"20件以下で検索結果を取得してほしい");
    
    [client release];
}

- (void)testSearchWithWord_TwittersBug
{
    TwitterClient *client = [[TwitterClient alloc] init];
    
    __block BOOL calledBack = NO;
    
    [client searchWithString:@"iOS" callback:^{
        calledBack = YES;
    }];
    
    NSDate *loopUntil = [NSDate dateWithTimeIntervalSinceNow:10];
    while (calledBack == NO && [loopUntil timeIntervalSinceNow] > 0) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                                 beforeDate:loopUntil];
    }
    
    STAssertEquals(20U, [[client tweets] count], @"20件以上取得するはずなので20個にまるめてほしい :-|");
    
    [client release];
}

- (void)testTweetForIndexPath
{
    TwitterClient *client = [[TwitterClient alloc] init];

    __block BOOL calledBack = NO;
    
    [client requestPublicTimeline:^(TwitterClientResponseStatus status) {
        
        calledBack = YES;
    }];
    
    NSDate *loopUntil = [NSDate dateWithTimeIntervalSinceNow:10];
    while (calledBack == NO && [loopUntil timeIntervalSinceNow] > 0) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                                 beforeDate:loopUntil];
    }
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    Tweet *tweet = [client tweetForIndexPath:indexPath];
    
    STAssertNotNil(tweet, @"なんか帰ってきてほしい");
    
    [client release];
}

- (void)testTweetForIndexPath_OverIndex
{
    TwitterClient *client = [[TwitterClient alloc] init];

    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
    Tweet *tweet = [client tweetForIndexPath:indexPath];
    
    STAssertNil(tweet, @"何も返ってこないはず");
    
    [client release];
}

@end
