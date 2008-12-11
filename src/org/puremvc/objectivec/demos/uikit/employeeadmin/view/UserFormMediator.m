//
//  UserFormMediator.m
//  PureMVC_ObjectiveC
//
//  PureMVC Port to ObjectiveC by Brian Knorr <brian.knorr@puremvc.org>
//  PureMVC - Copyright(c) 2006-2008 Futurescale, Inc., Some rights reserved.
//

#import "UserFormMediator.h"

@implementation UserFormMediator

+(NSString *)NAME {
	return @"UserFormMediator";
}

-(UserForm *)viewComponent {
	return viewComponent;
}

-(void)initializeMediator {
	self.mediatorName = [UserFormMediator NAME];
}

-(void)onRegister {
	self.viewComponent.delegate = self;
}

-(NSArray *)listNotificationInterests {
	return [NSArray arrayWithObjects:UserSelected, NewUser, nil];
}

-(void)onCreateUser:(UserVO *)userVO {
	[self sendNotification:CreateUser body:userVO];
}

-(void)onUpdateUser:(UserVO *)userVO {
	[self sendNotification:UpdateUser body:userVO];
}

-(void)handleNotification:(id<INotification>)notification {
	self.viewComponent.view = nil;
	if ([[notification name] isEqualToString:UserSelected]) {
		self.viewComponent.userVO = [notification body];
		self.viewComponent.mode = EDIT;
	} else if ([[notification name] isEqualToString:NewUser]) {
		self.viewComponent.userVO = [[[UserVO alloc] init] autorelease];
		self.viewComponent.mode = NEW;
	}
	[self sendNotification:ShowUserForm body:self.viewComponent];
}

-(void)dealloc {
	[super dealloc];
}

@end
