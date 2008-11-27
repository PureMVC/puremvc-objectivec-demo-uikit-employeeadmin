//
//  EmployeeAdminAppDelegate.m
//  PureMVC_ObjectiveC
//
//  PureMVC Port to ObjectiveC by Brian Knorr <brian.knorr@puremvc.org>
//  PureMVC - Copyright(c) 2006-2008 Futurescale, Inc., Some rights reserved.
//

#import "EmployeeAdminAppDelegate.h"
#import "ApplicationFacade.h"
#import "EmployeeAdminView.h"

@implementation EmployeeAdminAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	
	EmployeeAdminView *employeeAdminView = [[[EmployeeAdminView alloc] initWithFrame:[window frame]] autorelease];	
	[window addSubview:employeeAdminView];
	[[ApplicationFacade getInstance] startup:employeeAdminView];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    self.window = nil;
    [super dealloc];
}
