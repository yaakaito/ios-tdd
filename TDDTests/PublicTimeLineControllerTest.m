//
//  PublicTimeLineControllerTest.m
//  TDD
//
//  Created by KAZUMA Ukyo on 12/02/08.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PublicTimeLineControllerTest.h"

@implementation PublicTimeLineControllerTest

- (void)setUp {
    controller = [[PublicTimeLineController alloc] init];
}

- (void)tearDown {
    [controller release];
}

- (void)testView {
    STAssertEquals(controller.view, controller.viewController.view, @"viewがviewControllerのviewを指しているか");
}

- (void)testInterfaces {
    
    TwitterClient *client = [[TwitterClient alloc] init];
    
    __block BOOL calledBack = NO;
    
    NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:@"public_time_line" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:path];
    NSError *error=nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];    
    STAssertNil(error, @"jsonの読み込みに失敗");
    
    [client __setMockResponse:json];
    
    [client requestPublicTimeline:^(TwitterClientResponseStatus status) {
        
        calledBack = YES;
    }];
    
    NSDate *loopUntil = [NSDate dateWithTimeIntervalSinceNow:10];
    while (calledBack == NO && [loopUntil timeIntervalSinceNow] > 0) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                                 beforeDate:loopUntil];
    }
    
    STAssertEquals(20U, [[client tweets] count], @"20件取得するはずなのでcountが20になってほしい");
    
    controller.twitterClient = nil;
    controller.twitterClient = client;
    
    STAssertEquals(20, [controller tweetCount], @"20件あるはず %d", [controller tweetCount]);
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
    STAssertEqualObjects([client tweetForIndexPath:indexPath], [controller tweetForIndexPath:indexPath], @"tweetが一致しない");
    
    controller.twitterClient = nil;
    [client release];
}

@end
