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

-(void)initializeMediator {
	self.userProxy = [facade retrieveProxy:[UserProxy NAME]];
	[self userFormViewController].delegate = self;
}

-(UserFormViewController *)userFormViewController {
	return viewComponent;
}

+(NSString *)NAME {
	return @"UserFormMediator";
}

-(NSArray *)listNotificationInterests {
	return [NSArray arrayWithObjects:USER_SELECTED, NEW_USER, nil];
}

-(void)onAdd:(UserVO *)userVO {
	[userProxy addItem:userVO];
	[self sendNotification:USER_ADDED body:userVO];
}

-(void)onUpdate:(UserVO *)userVO {
	[userProxy updateItem:userVO];
	[self sendNotification:USER_UPDATED body:userVO];
}

-(void)handleNotification:(id<INotification>)notification {
	
	[self userFormViewController].view = nil;
	if ([[notification getName] isEqualToString:USER_SELECTED]) {
		[self userFormViewController].userVO = [notification getBody];
		[self userFormViewController].mode = EDIT;
	} else if ([[notification getName] isEqualToString:NEW_USER]) {
		[self userFormViewController].userVO = [[[UserVO alloc] init] autorelease];
		[self userFormViewController].mode = ADD;
	}
	[self sendNotification:SHOW_USER_FORM body:[self userFormViewController]];
}

-(void)dealloc {
	self.userProxy = nil;
	[super dealloc];
}

@end
