//
//  ILNewFriendViewController.h
//  001-YRDropdownView
//
//  Created by jeremy Templier on 22/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ILNewFriendViewDelegate.h"


@interface ILNewFriendViewController : UIViewController

@property (assign, nonatomic) NSObject<ILNewFriendViewDelegate>* delegate;
@property (retain, nonatomic) IBOutlet UITextField *nameTextField;

- (IBAction)saveButtonPressed:(id)sender;
- (IBAction)cancelButtonPressed:(id)sender;

@end
