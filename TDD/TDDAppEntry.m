//
//  TDDAppEntry.m
//  TDD
//
//  Created by KAZUMA Ukyo on 12/02/08.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TDDAppEntry.h"
#import "PublicTimeLineController.h"

@implementation TDDAppEntry
@synthesize rootViewController;

- (void)boot {
    
    NSLog(@"boot tdd app");
    
    PublicTimeLineController *publicTimeLine = [[PublicTimeLineController alloc] init];
    [self.rootViewController.view addSubview:publicTimeLine.view];
    
    [publicTimeLine release];
}
@end
