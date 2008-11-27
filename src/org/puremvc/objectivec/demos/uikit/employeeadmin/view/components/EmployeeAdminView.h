//
//  EmployeeAdminView.h
//  PureMVC_ObjectiveC
//
//  PureMVC Port to ObjectiveC by Brian Knorr <brian.knorr@puremvc.org>
//  PureMVC - Copyright(c) 2006-2008 Futurescale, Inc., Some rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserListViewController.h"
#import "UserFormViewController.h"

@interface EmployeeAdminView : UIView {
	UINavigationController *navigationController;
	UserListViewController *userListViewController;
	UserFormViewController *userFormViewController;
}

@property(nonatomic, retain) UINavigationController *navigationController;
@property(nonatomic, retain) UserListViewController *userListViewController;
@property(nonatomic, retain) UserFormViewController *userFormViewController;

@end
