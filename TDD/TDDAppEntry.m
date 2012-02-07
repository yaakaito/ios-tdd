//
//  TDDAppEntry.m
//  TDD
//
//  Created by KAZUMA Ukyo on 12/02/08.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TDDAppEntry.h"

@implementation TDDAppEntry
@synthesize rootViewController;

- (void)boot {
    
    NSLog(@"boot tdd app");
    
    _publicTimeLine = [[PublicTimeLineController alloc] init];
    [self.rootViewController.view addSubview:_publicTimeLine.view];
    
}

- (void)reboot {

    [_publicTimeLine release];

}
@end
