//
//  Tweet.h
//  TDD
//
//  Created by KAZUMA Ukyo on 12/01/17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tweet : NSObject
{
    NSString *_user;
    NSString *_text;
}

@property (nonatomic, retain) NSString* user;
@property (nonatomic, retain) NSString* text;

+ (Tweet*)tweetWithJSON:(id)JSON;

@end
