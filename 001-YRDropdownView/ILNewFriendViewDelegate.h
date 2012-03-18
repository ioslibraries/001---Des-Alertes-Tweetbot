//
//  ILNewFriendViewDelegate.h
//  001-YRDropdownView
//
//  Created by jeremy Templier on 22/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ILNewFriendViewController;
@protocol ILNewFriendViewDelegate <NSObject>

- (void) newFriendViewController:(ILNewFriendViewController*)viewController didCreateFriendWithName:(NSString*)name;

@end
