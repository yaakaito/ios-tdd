//
//  AppDelegate.h
//  TDD
//
//  Created by 右京 和馬 on 12/01/17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TDDAppEntry.h"
@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    
    TDDAppEntry *_appEntry;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@end
