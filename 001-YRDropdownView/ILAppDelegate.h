//
//  ILAppDelegate.h
//  001-YRDropdownView
//
//  Created by jeremy Templier on 22/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ILFriendsViewController;

@interface ILAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ILFriendsViewController *viewController;
@property (strong, nonatomic) UINavigationController *navController;

@end
