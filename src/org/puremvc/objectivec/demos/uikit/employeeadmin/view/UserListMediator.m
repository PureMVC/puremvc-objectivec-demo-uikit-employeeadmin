//
//  UserListMediator.m
//  PureMVC_ObjectiveC
//
//  PureMVC Port to ObjectiveC by Brian Knorr <brian.knorr@puremvc.org>
//  PureMVC - Copyright(c) 2006-2008 Futurescale, Inc., Some rights reserved.
//

#import "UserListMediator.h"

@implementation UserListMediator

+(NSString *)NAME {
	return @"UserListMediator";
}

-(UserList *)getViewComponent {
	return viewComponent;
}

-(void)initializeMediator {
	self.mediatorName = [UserListMediator NAME];
}

-(void)onRegister {
	self.viewComponent.delegate = self;
}

-(NSArray *)listNotificationInterests {
	return [NSArray arrayWithObjects:GetUsersSuccess, nil];
}

-(void)handleNotification:(id<INotification>)notification {
	if ([[notification getName] isEqualToString:GetUsersSuccess]) {
		[self.viewComponent reloadUsers:[notification getBody]];
	}
}

-(void)onUserListDidAppear {
	[self sendNotification:GetUsers];
}

-(void)onSelect:(UserVO *)userVO {
	[self sendNotification:UserSelected body:userVO];
}

-(void)onDelete:(UserVO *)userVO {
	[self sendNotification:DeleteUser body:userVO];
}

-(void)onNew {
	[self sendNotification:NewUser];
}

-(void)dealloc {
	[super dealloc];
}

@end
