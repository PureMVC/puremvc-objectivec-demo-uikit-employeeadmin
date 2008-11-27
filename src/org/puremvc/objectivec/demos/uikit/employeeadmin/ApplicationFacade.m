//
//  ApplicationFacade.m
//  PureMVC_ObjectiveC
//
//  PureMVC Port to ObjectiveC by Brian Knorr <brian.knorr@puremvc.org>
//  PureMVC - Copyright(c) 2006-2008 Futurescale, Inc., Some rights reserved.
//

#import "ApplicationFacade.h"
#import "StartupCommand.h"

@implementation ApplicationFacade

-(void)startup:(id)app {
	[self sendNotification:STARTUP body:app];
}

+(ApplicationFacade *)getInstance {
	return [super getInstance];
}

-(void)initializeController {
	[super initializeController];
	[self registerCommand:STARTUP commandClassRef:[StartupCommand class]];
}

@end
