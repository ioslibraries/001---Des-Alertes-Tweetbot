//
//  ILFriendsViewController.m
//  001-YRDropdownView
//
//  Created by jeremy Templier on 22/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ILFriendsViewController.h"
#import "ILNewFriendViewController.h"
#import "MKInfoPanel.h"
#import "YRDropdownView.h"

@implementation ILFriendsViewController
@synthesize friends;
@synthesize addButtonItem;

- (NSArray*) mockupFriends {
    return [NSArray arrayWithObjects:@"Jeremy Templier",
            @"John Doe", @"Jean Dupond" ,nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void) dealloc {
    self.friends = nil;
    [addButtonItem release];
    [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.friends = [NSMutableArray arrayWithArray:[self mockupFriends]];
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationItem.leftBarButtonItem  = self.addButtonItem;
}

- (void)viewDidUnload
{
    [self setAddButtonItem:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.friends count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    NSString* friendName = [self.friends objectAtIndex:indexPath.row];
    [cell.textLabel setText:friendName];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [self.friends removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        [MKInfoPanel showPanelInView:self.view type:MKInfoPanelTypeError title:@"Friend deleted." subtitle:@"Bye bye"hideAfter:2.0f];
    }   
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString* friendName = cell.textLabel.text;
    
//    [YRDropdownView showDropdownInView:self.view title:@"Poke !" detail:[NSString stringWithFormat:@"You poked %@.", friendName] animated:YES];
    
    [MKInfoPanel showPanelInView:self.view type:MKInfoPanelTypeInfo title:@"Poke !" subtitle:[NSString stringWithFormat:@"You poked %@.", friendName] hideAfter:2.0f];
}

- (IBAction)addFriendPressed:(id)sender {
    ILNewFriendViewController* viewController = [[[ILNewFriendViewController alloc] initWithNibName:@"ILNewFriendViewController" bundle:nil] autorelease];
    viewController.delegate = self;
    [self presentModalViewController:viewController animated:YES];
}

#pragma mark - ILNewFriendViewDelegate

- (void) newFriendViewController:(ILNewFriendViewController*)viewController didCreateFriendWithName:(NSString*)name {
    [self.friends addObject:name];
    [self.tableView reloadData];
    
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Friend created !" message:@"" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alertView show];
    [alertView release];
}



@end
