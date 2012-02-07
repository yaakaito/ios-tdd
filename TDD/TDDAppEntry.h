//
//  TDDAppEntry.h
//  TDD
//
//  Created by KAZUMA Ukyo on 12/02/08.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PublicTimeLineController.h"

@interface TDDAppEntry : NSObject {
    
    UIViewController *_rootViewController;
    
    @private
    PublicTimeLineController *_publicTimeLine;
}
@property(nonatomic,retain) UIViewController *rootViewController;

- (void)boot;
- (void)reboot;
@end
