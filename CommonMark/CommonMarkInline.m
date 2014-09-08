//
//  CommonMarkInline.m
//  Markdown
//
//  Created by Hoon H. on 9/7/14.
//  Copyright (c) 2014 Eonil. All rights reserved.
//

#import "CommonMarkInline.h"
#import "CommonMark__INTERNALS.h"
#import "CommonMark__INTERNAL_ENUM_MAPPINGS.h"
#import "CommonMark__INTERNAL_STRING_UTILITIES.h"



/*!
 @note
 See @c free_inlines function to get used union field for each tags.
 */
@implementation CommonMarkInline
{
	@private
	inl*				_raw;
}
+ (instancetype)CommonMark____instantiateWithRawPointer:(inl *)raw
{
	NSAssert(raw != NULL, @"Supplied raw pointer (inl*) shouldn't be NULL.");
	
	CommonMarkInline*	n1	=	[super new];
	n1->_raw				=	raw;
	return	n1;
}
- (CommonMarkInlineTag)tag
{
	return	lookup_inline_objc_tag(_raw->tag);
}
- (CommonMarkInline *)nextInline
{
	return	inline_from_raw(_raw->next);
}

static inline bool
has_literal(inl* raw)
{
	switch (raw->tag)
	{
		case str:
		case raw_html:
		case code:
		case entity:
		{
			return	true;
		}
		default:
		{
			return	false;
		}
	}
//	fail_by_program_bug();
}
static inline bool
has_linkable(inl* raw)
{
	switch (raw->tag)
	{
		case link:
		case image:
		{
			return	true;
		}
		default:
		{
			return	false;
		}
	}
//	fail_by_program_bug();
}
static inline bool
has_inlines(inl* raw)
{
	switch (raw->tag)
	{
		case emph:
		case strong:
		{
			return	true;
		}
		default:
		{
			return	false;
		}
	}
//	fail_by_program_bug();
}




- (NSString *)literal
{
	if (has_literal(_raw))
	{
		return	nsstring_from_bstr(_raw->content.literal);
	}
	return	nil;
}
- (id)linkage
{
	if (has_linkable(_raw))
	{
		return	nil;	///@todo
	}
	return	nil;
}
- (CommonMarkInlineList *)subinlines
{
	if (has_inlines(_raw))
	{
		CommonMarkInline*		n1	=	inline_from_raw(_raw->content.inlines);
		CommonMarkInlineList*	l1	=	inline_list_with_first(n1);
		return					l1	;
	}
	return	nil;
}

- (NSString *)description
{
	NSString*	s1	=	stringify_inline_tag([self tag]);
	NSString*	c1	=	[[self literal] description];
	NSString*	c2	=	[[self linkage] description];
	NSString*	c3	=	[[self subinlines] description];
	
	c1	=	c1 == nil ? @"" : c1;
	c2	=	c2 == nil ? @"" : c2;
	c3	=	c3 == nil ? @"" : c3;
	
	return		[NSString stringWithFormat:@"%@: %@%@%@", s1, c1, c2, c3];
}
@end
