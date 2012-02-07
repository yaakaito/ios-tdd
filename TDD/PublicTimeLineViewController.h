//
//  PublicTimeLineViewController.h
//  TDD
//
//  Created by KAZUMA Ukyo on 12/02/08.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

@protocol PublicTimeLineInterface
- (NSInteger)tweetCount;
- (Tweet*)tweetForIndexPath:(NSIndexPath*)indexPath;
- (void)reload;

@end

@interface PublicTimeLineViewController : UITableViewController {
    NSObject<PublicTimeLineInterface> *_controller;
}

@property(nonatomic,assign) NSObject<PublicTimeLineInterface> *controller;

@end
