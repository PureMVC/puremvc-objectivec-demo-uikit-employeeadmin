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

-(UserList *)viewComponent {
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
	if ([[notification name] isEqualToString:GetUsersSuccess]) {
		[self.viewComponent reloadUsers:[notification body]];
	}
}

-(void)onGetUsers {
	[self sendNotification:GetUsers];
}

-(void)onUserSelected:(UserVO *)userVO {
	[self sendNotification:UserSelected body:userVO];
}

-(void)onDeleteUser:(UserVO *)userVO {
	[self sendNotification:DeleteUser body:userVO];
}

-(void)onNewUser {
	[self sendNotification:NewUser];
}

-(void)dealloc {
	[super dealloc];
}

@end
