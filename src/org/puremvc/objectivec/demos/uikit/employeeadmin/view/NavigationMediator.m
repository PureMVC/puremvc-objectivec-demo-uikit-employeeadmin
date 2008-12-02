//
//  NavigationMediator.m
//  PureMVC_ObjectiveC
//
//  PureMVC Port to ObjectiveC by Brian Knorr <brian.knorr@puremvc.org>
//  PureMVC - Copyright(c) 2006-2008 Futurescale, Inc., Some rights reserved.
//

#import "NavigationMediator.h"
#import "ApplicationFacade.h"

@implementation NavigationMediator

+(NSString *)NAME {
	return @"NavigationMediator";
}

-(NSArray *)listNotificationInterests {
	return [NSArray arrayWithObjects:SHOW_USER_FORM, SHOW_USER_LIST, nil];
}

-(UINavigationController *)getViewComponent {
	return viewComponent;
}

-(void)handleNotification:(id<INotification>)notification {
	
	if ([[notification getName] isEqualToString:SHOW_USER_FORM]) {
		[self.viewComponent pushViewController:[notification getBody] animated:YES];
	}
	if ([[notification getName] isEqualToString:SHOW_USER_LIST]) {
		[self.viewComponent popToRootViewControllerAnimated:YES];
	}
}

@end
