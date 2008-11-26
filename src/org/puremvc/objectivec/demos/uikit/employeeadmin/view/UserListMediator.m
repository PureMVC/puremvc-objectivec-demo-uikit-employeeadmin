//
//  UserListMediator.m
//  PureMVC_ObjectiveC
//
//  PureMVC Port to ObjectiveC by Brian Knorr <brian.knorr@puremvc.org>
//  PureMVC - Copyright(c) 2006-2008 Futurescale, Inc., Some rights reserved.
//

#import "UserListMediator.h"

static NSString *NAME = @"UserListMediator";

@implementation UserListMediator

@synthesize userProxy;

-(void)initializeMediator {
	self.userProxy = [facade retrieveProxy:[UserProxy NAME]];
	[self userListViewController].users = [userProxy users];
	[self userListViewController].delegate = self;
}

-(UserListViewController *)userListViewController {
	return viewComponent;
}

+(NSString *)NAME {
	return @"UserListMediator";
}

-(NSArray *)listNotificationInterests {
	return [NSArray arrayWithObjects:USER_ADDED, USER_UPDATED, nil];
}

-(void)handleNotification:(id<INotification>)notification {
	
	if ([[notification getName] isEqualToString:USER_ADDED] || [[notification getName] isEqualToString:USER_UPDATED]) {
		[[self userListViewController].tableView reloadData];
		[self sendNotification:POP_TO_ROOT];
	}
}

-(void)onSelect:(UserVO *)userVO {
	[self sendNotification:USER_SELECTED body:userVO];
}

-(void)onDelete:(UserVO *)userVO {}

-(void)onNew {
	NSLog(@"onNew");
	[self sendNotification:NEW_USER];
}

-(void)dealloc {
	self.userProxy = nil;
	[super dealloc];
}

@end
