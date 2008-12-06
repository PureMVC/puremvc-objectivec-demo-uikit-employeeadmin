//
//  UserList.m
//  PureMVC_ObjectiveC
//
//  PureMVC Port to ObjectiveC by Brian Knorr <brian.knorr@puremvc.org>
//  PureMVC - Copyright(c) 2006-2008 Futurescale, Inc., Some rights reserved.
//

#import "UserList.h"

#define USER_CELL_ID @"UserCellID"

@implementation UserList

@synthesize users, delegate;

-(id)init {
	return [super initWithStyle:UITableViewStylePlain];
}

- (void)loadView {
	[super loadView];
	self.navigationItem.title = @"Users";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addClicked)];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *userCell = [tableView dequeueReusableCellWithIdentifier:USER_CELL_ID];
	if (userCell == nil) {
		userCell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:USER_CELL_ID] autorelease];
		userCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}
	UserVO *userVO = [users objectAtIndex:indexPath.row];
	userCell.text = [userVO givenName];
	return userCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [users count];
}

-(void)addClicked {
	[delegate onNew];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[delegate onSelect:[users objectAtIndex:indexPath.row]];
}

- (void)dealloc {
	self.users = nil;
	self.delegate = nil;
    [super dealloc];
}


@end
