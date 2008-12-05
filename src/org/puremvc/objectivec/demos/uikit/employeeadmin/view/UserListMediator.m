//
//  UserListMediator.m
//  PureMVC_ObjectiveC
//
//  PureMVC Port to ObjectiveC by Brian Knorr <brian.knorr@puremvc.org>
//  PureMVC - Copyright(c) 2006-2008 Futurescale, Inc., Some rights reserved.
//

#import "UserListMediator.h"

@implementation UserListMediator

@synthesize userProxy;

-(UserList *)getViewComponent {
	return viewComponent;
}

-(void)initializeMediator {
	self.userProxy = (UserProxy *)[facade retrieveProxy:[UserProxy NAME]];
	self.viewComponent.users = userProxy.data;
	self.viewComponent.delegate = self;
}

+(NSString *)NAME {
	return @"UserListMediator";
}

-(NSArray *)listNotificationInterests {
	return [NSArray arrayWithObjects:UserAdded, UserUpdated, nil];
}

-(void)handleNotification:(id<INotification>)notification {
	if ([[notification getName] isEqualToString:UserAdded] || [[notification getName] isEqualToString:UserUpdated]) {
		[self.viewComponent.tableView reloadData];
		[self sendNotification:ShowUserList];
	}
}

-(void)onSelect:(UserVO *)userVO {
	[self sendNotification:UserSelected body:userVO];
}

-(void)onDelete:(UserVO *)userVO {}

-(void)onNew {
	[self sendNotification:NewUser];
}

-(void)dealloc {
	self.userProxy = nil;
	[super dealloc];
}

@end
