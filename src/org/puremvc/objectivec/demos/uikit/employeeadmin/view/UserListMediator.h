//
//  UserListMediator.h
//  PureMVC_ObjectiveC
//
//  PureMVC Port to ObjectiveC by Brian Knorr <brian.knorr@puremvc.org>
//  PureMVC - Copyright(c) 2006-2008 Futurescale, Inc., Some rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mediator.h"
#import "UserProxy.h"
#import "UserListViewController.h"
#import "ApplicationFacade.h"

@interface UserListMediator : Mediator <UserListViewControllerDelegate>{
	UserProxy *userProxy;
}

@property(nonatomic, retain) UserProxy *userProxy;

@end
