//
//  CommonMarkInlineLinkage.m
//  CommonMark
//
//  Created by Hoon H. on 9/8/14.
//  Copyright (c) 2014 Eonil. All rights reserved.
//

#import "CommonMarkInlineLinkage.h"
#import "stmd/stmd.h"
#import "CommonMark__INTERNALS.h"
#import "CommonMark__INTERNAL_STRING_UTILITIES.h"

@implementation CommonMarkInlineLinkage
//{
//	@private
//
//	CommonMarkInlineList*	_sublines;
//
//	
//	struct Inline*	_raw_label;
//	bstring			_raw_url;
//	bstring			_raw_title;
//}
+ (instancetype)CommonMark____instantiateWithRawLabel:(struct Inline *)rawLabel rawURL:(bstring)rawURL rawTitle:(bstring)rawTitle
{
	CommonMarkInlineLinkage*	l1	=	[super CommonMark____instantiate];
//	l1->_raw_label					=	rawLabel;
//	l1->_raw_url					=	rawURL;
//	l1->_raw_title					=	rawTitle;
//	return	l1;
	
	/*
	 Eagerly resolve and cache them.
	 */
	l1->_subinlines	=	inline_list_with_first(inline_from_raw(rawLabel));
	l1->_address	=	nsstring_from_bstr(rawURL);
	l1->_title		=	nsstring_from_bstr(rawTitle);
	return	l1;
}
//- (CommonMarkInlineList *)subinlines
//{
//	return	inline_list_with_first(inline_from_raw(_raw_label));
//}
//- (NSString *)address
//{
//	return	nsstring_from_bstr(_raw_url);
//}
//- (NSString *)title
//{
//	return	nsstring_from_bstr(_raw_title);
//}



- (NSString *)description
{
	NSString*	s1	=	[[self address] description];
	NSString*	s2	=	[[self title] description];
	NSString*	s3	=	[[self subinlines] description];
	NSString*	s3b	=	add_prefix_to_lines_from_text(s3, @"  ");
	
	NSString*	p1	=	s1 == nil ? @"" : s1;
	NSString*	p2	=	s2 == nil ? @"" : s2;
	NSString*	p3	=	s3b == nil ? @"" : s3b;
	
	return	[NSString stringWithFormat:@"(address = %@, title = %@)\n%@", p1, p2, p3];
}
@end






