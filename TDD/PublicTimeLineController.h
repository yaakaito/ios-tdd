//
//  PublicTimeLineController.h
//  TDD
//
//  Created by KAZUMA Ukyo on 12/02/08.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PublicTimeLineViewController.h"
#import "TwitterClient.h"


@interface PublicTimeLineController : NSObject<PublicTimeLineInterface> {
    
    PublicTimeLineViewController *_viewController;
@private
    TwitterClient *_twitterClient;
}
@property(nonatomic,retain) PublicTimeLineViewController *viewController;
@property(nonatomic,retain) TwitterClient *twitterClient;

- (UIView*)view;
@end
