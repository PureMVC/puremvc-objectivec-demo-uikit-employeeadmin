//
//  UserFormMediator.m
//  PureMVC_ObjectiveC
//
//  PureMVC Port to ObjectiveC by Brian Knorr <brian.knorr@puremvc.org>
//  PureMVC - Copyright(c) 2006-2008 Futurescale, Inc., Some rights reserved.
//

#import "UserFormMediator.h"

@implementation UserFormMediator

@synthesize userProxy;

+(NSString *)NAME {
	return @"UserFormMediator";
}

-(UserForm *)getViewComponent {
	return viewComponent;
}

-(void)initializeMediator {
	self.mediatorName = [UserFormMediator NAME];
	self.userProxy = (UserProxy *)[facade retrieveProxy:[UserProxy NAME]];
	self.viewComponent.delegate = self;
}

-(NSArray *)listNotificationInterests {
	return [NSArray arrayWithObjects:UserSelected, NewUser, nil];
}

-(void)onAdd:(UserVO *)userVO {
	[userProxy addItem:userVO];
	[self sendNotification:UserAdded body:userVO];
}

-(void)onUpdate:(UserVO *)userVO {
	[userProxy updateItem:userVO];
	[self sendNotification:UserUpdated body:userVO];
}

-(void)handleNotification:(id<INotification>)notification {
	
	self.viewComponent.view = nil;
	if ([[notification getName] isEqualToString:UserSelected]) {
		self.viewComponent.userVO = [notification getBody];
		self.viewComponent.mode = EDIT;
	} else if ([[notification getName] isEqualToString:NewUser]) {
		self.viewComponent.userVO = [[[UserVO alloc] init] autorelease];
		self.viewComponent.mode = ADD;
	}
	[self sendNotification:ShowUserForm body:self.viewComponent];
}

-(void)dealloc {
	self.userProxy = nil;
	[super dealloc];
}

@end
