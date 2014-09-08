//
//  CommonMarkInlineList.m
//  Markdown
//
//  Created by Hoon H. on 9/8/14.
//  Copyright (c) 2014 Eonil. All rights reserved.
//

#import "CommonMarkInlineList.h"
#import "CommonMark__INTERNAL_STRING_UTILITIES.h"

@implementation CommonMarkInlineList
{
	@private
	CommonMarkInline*	_first;
}
- (CommonMarkInline *)firstInline
{
	return	_first;
}
- (NSArray *)allInlines
{
	NSArray*			a1	=	@[_first];
	CommonMarkInline*	n1	=	_first;
	
	while ((n1 = [n1 nextInline]) != nil)
	{
		a1	=	[a1 arrayByAddingObject:n1];
	}
	
	return	a1;
}
- (NSString *)description
{
	NSArray*	s1	=	descriptions_of_items_in([self allInlines]);
	NSArray*	s2	=	add_prefix_to_lines(s1, @"  ");
	NSString*	s3	=	[s2 componentsJoinedByString:@"\n"];
	return		s3	;
}
+ (instancetype)CommonMark____instantiateWithFirstInline:(CommonMarkInline *)first
{
	NSAssert([first isKindOfClass:[CommonMarkInline class]], @"Supplied first inline should be a valid instance.");
	
	CommonMarkInlineList*	l1	=	[super CommonMark____instantiate];
	l1->_first					=	first;
	return	l1;
}
@end
