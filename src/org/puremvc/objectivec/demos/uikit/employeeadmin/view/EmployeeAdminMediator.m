//
//  EmployeeAdminMediator.m
//  PureMVC_ObjectiveC
//
//  PureMVC Port to ObjectiveC by Brian Knorr <brian.knorr@puremvc.org>
//  PureMVC - Copyright(c) 2006-2008 Futurescale, Inc., Some rights reserved.
//

#import "EmployeeAdminMediator.h"
#import "EmployeeAdmin.h"
#import "ApplicationFacade.h"

@implementation EmployeeAdminMediator

+(NSString *)NAME {
	return @"NavigationMediator";
}

-(NSArray *)listNotificationInterests {
	return [NSArray arrayWithObjects:ShowUserForm, ShowUserList, nil];
}

-(EmployeeAdmin *)getViewComponent {
	return viewComponent;
}

-(void)handleNotification:(id<INotification>)notification {
	
	if ([[notification getName] isEqualToString:ShowUserForm]) {
		[self.viewComponent showUserForm];
	}
	if ([[notification getName] isEqualToString:ShowUserList]) {
		[self.viewComponent showUserList];
	}
}


@end
