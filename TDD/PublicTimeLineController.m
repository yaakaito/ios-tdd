//
//  PublicTimeLineController.m
//  TDD
//
//  Created by KAZUMA Ukyo on 12/02/08.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PublicTimeLineController.h"

@implementation PublicTimeLineController

@synthesize viewController = _viewController;
@synthesize twitterClient  = _twitterClient;

- (id)init {
    self = [super init];
    if(self){
        self.viewController = [[PublicTimeLineViewController alloc] initWithNibName:@"PublicTimeLineViewController" bundle:nil];
        self.viewController.controller = self;
        self.twitterClient  = [[TwitterClient alloc] init];
    }
    return self;
}

- (void)dealloc {
    
    [self.viewController release];
    self.viewController = nil;
    [self.twitterClient release];
    self.twitterClient  = nil;
    
    [super dealloc];
}

- (UIView*)view {
    return self.viewController.view;
}

- (NSInteger)tweetCount {
    
    return [self.twitterClient.tweets count];
}

- (Tweet*)tweetForIndexPath:(NSIndexPath *)indexPath {
    return [self.twitterClient tweetForIndexPath:indexPath];
}

- (void)reload {
    NSLog(@"reload");
    [self.twitterClient requestPublicTimeline:^(TwitterClientResponseStatus status) {
        if(status == TwitterClientResponseStatusSuccess){
            NSLog(@"success");
            [self.viewController.tableView performSelector:@selector(reloadData)];
        }
    }];
}

@end
