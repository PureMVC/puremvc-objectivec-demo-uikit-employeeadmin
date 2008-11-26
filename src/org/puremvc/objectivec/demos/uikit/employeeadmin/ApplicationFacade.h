//
//  ApplicationFacade.h
//  PureMVC_ObjectiveC
//
//  PureMVC Port to ObjectiveC by Brian Knorr <brian.knorr@puremvc.org>
//  PureMVC - Copyright(c) 2006-2008 Futurescale, Inc., Some rights reserved.
//

#import <UIKit/UIKit.h>
#import "Facade.h"

#define STARTUP @"STARTUP"
#define NEW_USER @"NEW_USER"
#define USER_SELECTED @"USER_SELECTED"
#define USER_ADDED @"USER_ADDED"
#define USER_UPDATED @"USER_UPDATED"

#define PUSH_USER_FORM @"PUSH_USER_FORM"
#define POP_TO_ROOT @"POP_TO_ROOT"

@interface ApplicationFacade : Facade {

}

-(void)startup:(id)app;

@end
