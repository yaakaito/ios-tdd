//
//  TDDAppEntry.h
//  TDD
//
//  Created by KAZUMA Ukyo on 12/02/08.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TDDAppEntry : NSObject {
    
    UIViewController *_rootViewController;
}
@property(nonatomic, strong) UIViewController *rootViewController;

- (void)boot;
@end
