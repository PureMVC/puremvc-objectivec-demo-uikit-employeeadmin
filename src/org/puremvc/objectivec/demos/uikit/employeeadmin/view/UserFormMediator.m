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

-(UserFormViewController *)getViewComponent {
	return viewComponent;
}

-(void)initializeMediator {
	self.userProxy = [facade retrieveProxy:[UserProxy NAME]];
	self.viewComponent.delegate = self;
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
	
	self.viewComponent.view = nil;
	if ([[notification getName] isEqualToString:USER_SELECTED]) {
		self.viewComponent.userVO = [notification getBody];
		self.viewComponent.mode = EDIT;
	} else if ([[notification getName] isEqualToString:NEW_USER]) {
		self.viewComponent.userVO = [[[UserVO alloc] init] autorelease];
		self.viewComponent.mode = ADD;
	}
	[self sendNotification:SHOW_USER_FORM body:self.viewComponent];
}

-(void)dealloc {
	self.userProxy = nil;
	[super dealloc];
}

@end
