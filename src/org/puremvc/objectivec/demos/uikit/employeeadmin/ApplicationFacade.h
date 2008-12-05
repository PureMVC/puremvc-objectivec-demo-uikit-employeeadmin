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
#define UserAdded @"UserAdded"
#define UserUpdated @"UserUpdated"

#define ShowUserForm @"ShowUserForm"
#define ShowUserList @"ShowUserList"

@interface ApplicationFacade : Facade {

}

+(ApplicationFacade *)getInstance;

-(void)startup:(id)app;

@end
