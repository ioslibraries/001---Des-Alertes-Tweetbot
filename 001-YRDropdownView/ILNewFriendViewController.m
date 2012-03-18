//
//  ILNewFriendViewController.m
//  001-YRDropdownView
//
//  Created by jeremy Templier on 22/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ILNewFriendViewController.h"

@implementation ILNewFriendViewController
@synthesize nameTextField;
@synthesize delegate;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.nameTextField becomeFirstResponder];
    
}

- (void)viewDidUnload
{
    [self setNameTextField:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)saveButtonPressed:(id)sender {
    if ([delegate respondsToSelector:@selector(newFriendViewController:didCreateFriendWithName:)]) {
        [delegate newFriendViewController:self didCreateFriendWithName:self.nameTextField.text];
    }
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)cancelButtonPressed:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

- (void)dealloc {
    [nameTextField release];
    [super dealloc];
}
@end
