//
//  EmployeeAdminAppDelegate.m
//  PureMVC_ObjectiveC
//
//  PureMVC Port to ObjectiveC by Brian Knorr <brian.knorr@puremvc.org>
//  PureMVC - Copyright(c) 2006-2008 Futurescale, Inc., Some rights reserved.
//

#import "EmployeeAdminAppDelegate.h"
#import "ApplicationFacade.h"

@implementation EmployeeAdminAppDelegate

@synthesize window, navigationController, userListViewController, userFormViewController;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	
	self.navigationController = [[[UINavigationController alloc] init] autorelease];
	self.userListViewController = [[[UserListViewController alloc] init] autorelease];
	self.userFormViewController = [[[UserFormViewController alloc] init] autorelease];
	
	[navigationController pushViewController:userListViewController animated:NO];
	[window addSubview:navigationController.view];
	
	[[ApplicationFacade getInstance] startup:self];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    self.window = nil;
	self.navigationController = nil;
	self.userListViewController = nil;
	self.userFormViewController = nil;
    [super dealloc];
}
