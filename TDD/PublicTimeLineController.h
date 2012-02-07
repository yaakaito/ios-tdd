//
//  PublicTimeLineController.h
//  TDD
//
//  Created by KAZUMA Ukyo on 12/02/08.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PublicTimeLineViewController.h"


@interface PublicTimeLineController : NSObject {
    
    PublicTimeLineViewController *_viewController;
}
@property(nonatomic,strong) PublicTimeLineViewController *viewController;

- (UIView*)view;
@end
