//
//  EmployeeAdminView.m
//  PureMVC_ObjectiveC
//
//  PureMVC Port to ObjectiveC by Brian Knorr <brian.knorr@puremvc.org>
//  PureMVC - Copyright(c) 2006-2008 Futurescale, Inc., Some rights reserved.
//

#import "EmployeeAdminView.h"


@implementation EmployeeAdminView

@synthesize userListViewController, userFormViewController, navigationController;

-(id)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		self.navigationController = [[[UINavigationController alloc] init] autorelease];
		self.userListViewController = [[[UserListViewController alloc] init] autorelease];
		self.userFormViewController = [[[UserFormViewController alloc] init] autorelease];
		[navigationController pushViewController:userListViewController animated:NO];
		[self addSubview:navigationController.view];
	}
	return self;
}

- (void)dealloc {
	self.navigationController = nil;
	self.userListViewController = nil;
	self.userFormViewController = nil;
    [super dealloc];
}

@end
