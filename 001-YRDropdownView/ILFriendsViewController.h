//
//  ILFriendsViewController.h
//  001-YRDropdownView
//
//  Created by jeremy Templier on 22/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ILNewFriendViewDelegate.h"

@interface ILFriendsViewController : UITableViewController <ILNewFriendViewDelegate>

@property (strong, nonatomic) NSMutableArray* friends;
@property (retain, nonatomic) IBOutlet UIBarButtonItem *addButtonItem;

- (IBAction)addFriendPressed:(id)sender;

@end
