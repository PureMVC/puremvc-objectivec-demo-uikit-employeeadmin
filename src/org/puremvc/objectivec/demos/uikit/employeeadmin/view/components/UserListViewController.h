//
//  UserListViewController.h
//  PureMVC_ObjectiveC
//
//  PureMVC Port to ObjectiveC by Brian Knorr <brian.knorr@puremvc.org>
//  PureMVC - Copyright(c) 2006-2008 Futurescale, Inc., Some rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserVO.h"

@protocol UserListViewControllerDelegate

-(void)onSelect:(UserVO *)userVO;
-(void)onDelete:(UserVO *)userVO;
-(void)onNew;

@end



@interface UserListViewController : UITableViewController {
	NSArray *users;
	id<UserListViewControllerDelegate> delegate;
}

@property(nonatomic, retain) NSArray *users;
@property(nonatomic, retain) id<UserListViewControllerDelegate> delegate;

@end
