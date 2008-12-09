//
//  ApplicationFacade.h
//  PureMVC_ObjectiveC
//
//  PureMVC Port to ObjectiveC by Brian Knorr <brian.knorr@puremvc.org>
//  PureMVC - Copyright(c) 2006-2008 Futurescale, Inc., Some rights reserved.
//

#import <UIKit/UIKit.h>
#import "Facade.h"

#define Startup @"Startup"
#define NewUser @"NewUser"
#define UserSelected @"UserSelected"
#define AddUser @"AddUser"
#define UpdateUser @"UpdateUser"
#define ShowUserForm @"ShowUserForm"
#define ShowUserList @"ShowUserList"
#define ShowError @"ShowError"
#define GetUsers @"GetUsers"
#define GetUsersSuccess @"GetUsersSuccess"

@interface ApplicationFacade : Facade {

}

+(ApplicationFacade *)getInstance;

-(void)startup:(id)app;

@end
