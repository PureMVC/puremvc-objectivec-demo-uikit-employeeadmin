//
//  StartupCommand.m
//  PureMVC_ObjectiveC
//
//  PureMVC Port to ObjectiveC by Brian Knorr <brian.knorr@puremvc.org>
//  PureMVC - Copyright(c) 2006-2008 Futurescale, Inc., Some rights reserved.
//

#import "StartupCommand.h"
#import "EmployeeAdminView.h"
#import "ApplicationFacade.h"
#import "UserListMediator.h"
#import "UserProxy.h"
#import "UserFormMediator.h"
#import "NavigationMediator.h"

@implementation StartupCommand

-(void)execute:(id<INotification>)notification {
	[facade registerProxy:[UserProxy proxy]];
	
	EmployeeAdminView *app = [notification getBody];
	ApplicationFacade *facade = [ApplicationFacade getInstance];
	
	[facade registerMediator:[NavigationMediator withViewComponent:app.navigationController]];
	[facade registerMediator:[UserListMediator withViewComponent:app.userListViewController]];
	[facade registerMediator:[UserFormMediator withViewComponent:app.userFormViewController]];
}

@end
