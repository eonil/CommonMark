//
//  CommonMarkBlockList.m
//  Markdown
//
//  Created by Hoon H. on 9/8/14.
//  Copyright (c) 2014 Eonil. All rights reserved.
//

#import "CommonMarkBlockList.h"
#import "CommonMark__INTERNALS.h"
#import "CommonMark__INTERNAL_STRING_UTILITIES.h"

@implementation CommonMarkBlockList
{
	CommonMarkBlock*	_first;
	CommonMarkBlock*	_last;
}
+ (instancetype)CommonMark____instantiateWithFirstBlock:(CommonMarkBlock *)firstBlock andLastBlock:(CommonMarkBlock *)lastBlock
{
	NSAssert([firstBlock isKindOfClass:[CommonMarkBlock class]], @"Supplied parameter (firstBlock) must be a valid object instance.");
	NSAssert([lastBlock isKindOfClass:[CommonMarkBlock class]], @"Supplied parameter (lastBlock) must be a valid object instance.");
	
	CommonMarkBlockList*	l1	=	[CommonMarkBlockList CommonMark____instantiate];
	l1->_first					=	firstBlock;
	l1->_last					=	lastBlock;
	return	l1;
}
- (CommonMarkBlock *)firstBlock
{
	return	_first;
}
- (CommonMarkBlock *)lastBlock
{
	return	_last;
}
- (NSArray *)allBlocks
{
	NSAssert([[self firstBlock] isKindOfClass:[CommonMarkBlock class]], @"-[self firstBlock] must be a valid object instance.");
	
	CommonMarkBlock*		b1	=	[self firstBlock];
	NSArray*				a1	=	@[b1];
	while ((b1 = [b1 nextBlock]))
	{
		a1	=	[a1 arrayByAddingObject:b1];
	}
	return	a1;
}
- (NSString *)description
{
	NSArray*	s1	=	descriptions_of_items_in([self allBlocks]);
	NSArray*	s2	=	add_prefix_to_lines(s1, @"  ");
	NSString*	s3	=	[s2 componentsJoinedByString:@"\n"];
	return		s3	;
}
@end
