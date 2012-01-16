//
//  TwitterClient.m
//  TDD
//
//  Created by KAZUMA Ukyo on 12/01/17.
//  Copyright (c) 2012年 yaakaito.org. All rights reserved.
//

#import "TwitterClient.h"
#import "AFJSONRequestOperation.h"

@implementation TwitterClient

@synthesize tweets = _tweets;

- (id)init
{
    self = [super init];
    if(self)
    {
        _tweets = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)requestPublicTimeline:(void (^)(TwitterClientResponseStatus status))callback
{
    NSURL *url = [NSURL URLWithString:@"https://api.twitter.com/1/statuses/public_timeline.json?count=20"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request
                                                                                        success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON){
                                                                                            
                                                                                            [_tweets removeAllObjects];
                                                                                            NSArray *tweetsJSON = JSON;
                                                                                            for (id tweetJSON in tweetsJSON) {
                                                                                                [_tweets addObject:[Tweet tweetWithJSON:tweetJSON]];
                                                                                            }
                                                                                            
                                                                                            callback(TwitterClientResponseStatusSuccess);
                                                                                            
                                                                                        }
                                                                                        failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON){
                                                                                            
                                                                                            callback(TwitterClientResponseStatusFail);
                                                                                        }];
    NSOperationQueue *queue = [[[NSOperationQueue alloc] init] autorelease];
    [queue addOperation:operation];

}

- (void)searchWithString:(NSString *)word callback:(void (^)())callback
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://search.twitter.com/search.json?q=%@&rpp=20&result_type=mixed", word]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request
                                                                                        success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON){
                                                                                            
                                                                                            [_tweets removeAllObjects];
                                                                                            NSArray *tweetsJSON = [JSON objectForKey:@"results"];
                                                                                            for (id tweetJSON in tweetsJSON) {
                                                                                                if([_tweets count] == 20){
                                                                                                    break;
                                                                                                }
                                                                                                
                                                                                                [_tweets addObject:[Tweet tweetWithJSON:tweetJSON]];
                                                                                            }
                                                                                            
                                                                                            callback(TwitterClientResponseStatusSuccess);
                                                                                            
                                                                                        }
                                                                                        failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON){
                                                                                            
                                                                                            callback(TwitterClientResponseStatusFail);
                                                                                        }];
    NSOperationQueue *queue = [[[NSOperationQueue alloc] init] autorelease];
    [queue addOperation:operation];
}

- (Tweet*)tweetForIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row > [_tweets count]){
        return nil;
    }
    
    return [_tweets objectAtIndex:indexPath.row];
}

- (void)dealloc
{
    [_tweets release];
    
    
    [super dealloc];
}

@end
