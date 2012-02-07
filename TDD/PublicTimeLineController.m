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

- (id)init {
    self = [super init];
    if(self){
        self.viewController = [[[PublicTimeLineViewController alloc] initWithNibName:@"PublicTimeLineViewController" bundle:nil] autorelease];
    }
    return self;
}

- (UIView*)view {
    return self.viewController.view;
}

@end
