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

#define SHOW_USER_FORM @"SHOW_USER_FORM"
#define SHOW_USER_LIST @"SHOW_USER_LIST"

@interface ApplicationFacade : Facade {

}

+(ApplicationFacade *)getInstance;

-(void)startup:(id)app;

@end
