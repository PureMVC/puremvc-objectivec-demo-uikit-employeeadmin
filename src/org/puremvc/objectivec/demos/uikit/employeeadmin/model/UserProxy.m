//
//  UserProxy.m
//  PureMVC_ObjectiveC
//
//  PureMVC Port to ObjectiveC by Brian Knorr <brian.knorr@puremvc.org>
//  PureMVC - Copyright(c) 2006-2008 Futurescale, Inc., Some rights reserved.
//

#import "UserProxy.h"
#import "UserVO.h"

@implementation UserProxy

-(void)initializeProxy {
	[super initializeProxy];
	self.data = [NSMutableArray array];
	self.proxyName = [UserProxy NAME];
	[self addItem:[UserVO withUserName:@"lstooge" firstName:@"Larry" lastName:@"Stooge" email:@"larry@stooges.com" password:@"ijk456" confirmPassword:@"ijk456" department:@"Accounting"]];
	[self addItem:[UserVO withUserName:@"cstooge" firstName:@"Curly" lastName:@"Stooge" email:@"curly@stooges.com" password:@"xyz987" confirmPassword:@"xyz987" department:@"Sales"]];
	[self addItem:[UserVO withUserName:@"mstooge" firstName:@"Moe" lastName:@"Stooge" email:@"moe@stooges.com" password:@"abc123" confirmPassword:@"abc123" department:@"Plant"]];
}

+(NSString *)NAME {
	return @"UserProxy";
}

-(NSMutableArray *)users {
	return data;
}

-(void)addItem:(id)item {
	[[self users] addObject:item];
}

-(void)updateItem:(id)item {
	for (int i=0; i<[[self users] count]; i++) {
		UserVO *userVO = [[self users] objectAtIndex:i];
		if ([userVO.username isEqualToString:[item username]]) {
			[[self users] replaceObjectAtIndex:i withObject:userVO];
		}
	}
}

-(void)deleteItem:(id)item {
	for (int i=0; i<[[self users] count]; i++) {
		UserVO *userVO = [[self users] objectAtIndex:i];
		if ([userVO.username isEqualToString:[item username]]) {
			[[self users] removeObjectAtIndex:i];
		}
	}
}

-(void)dealloc {
	[super dealloc];
}

@end
