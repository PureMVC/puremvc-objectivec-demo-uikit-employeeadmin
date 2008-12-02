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

-(UserListViewController *)getViewComponent {
	return viewComponent;
}

-(void)initializeMediator {
	self.userProxy = [facade retrieveProxy:[UserProxy NAME]];
	self.viewComponent.users = [userProxy users];
	self.viewComponent.delegate = self;
}

+(NSString *)NAME {
	return @"UserListMediator";
}

-(NSArray *)listNotificationInterests {
	return [NSArray arrayWithObjects:USER_ADDED, USER_UPDATED, nil];
}

-(void)handleNotification:(id<INotification>)notification {
	
	if ([[notification getName] isEqualToString:USER_ADDED] || [[notification getName] isEqualToString:USER_UPDATED]) {
		[self.viewComponent.tableView reloadData];
		[self sendNotification:SHOW_USER_LIST];
	}
}

-(void)onSelect:(UserVO *)userVO {
	[self sendNotification:USER_SELECTED body:userVO];
}

-(void)onDelete:(UserVO *)userVO {}

-(void)onNew {
	[self sendNotification:NEW_USER];
}

-(void)dealloc {
	self.userProxy = nil;
	[super dealloc];
}

@end
