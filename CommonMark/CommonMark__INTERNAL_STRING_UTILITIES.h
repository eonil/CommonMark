//
//  CommonMark__INTERNAL_STRING_UTILITIES.h
//  Markdown
//
//  Created by Hoon H. on 9/8/14.
//  Copyright (c) 2014 Eonil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "stmd/stmd.h"
#import "CommonMark__INTERNALS.h"

static inline NSString*
stringify_block_tag(CommonMarkBlockTag const tag)
{
	switch (tag)
	{
		case	CommonMarkBlockTagDocument:			return	@"Document";
		case	CommonMarkBlockTagBlockQuote:		return	@"BlockQuote";
		case	CommonMarkBlockTagList:				return	@"List";
		case	CommonMarkBlockTagListItem:			return	@"ListItem";
		case	CommonMarkBlockTagFencedCode:		return	@"FencedCode";
		case	CommonMarkBlockTagIndentedCode:		return	@"IndentedCode";
		case	CommonMarkBlockTagHTMLBlock:		return	@"HTMLBlock";
		case	CommonMarkBlockTagParagraph:		return	@"Paragraph";
		case	CommonMarkBlockTagATXHeader:		return	@"ATXHeader";
		case	CommonMarkBlockTagSetEXTHeader:		return	@"SetEXTHeader";
		case	CommonMarkBlockTagHRule:			return	@"HRule";
		case	CommonMarkBlockTagReferenceDef:		return	@"ReferenceDef";
	}
	fail_by_program_bug();
}

static inline NSString*
stringify_inline_tag(CommonMarkInlineTag const tag)
{
	switch (tag)
	{
		case	CommonMarkInlineTagString:			return	@"CommonMarkInlineTagString";
		case	CommonMarkInlineTagSoftbreak:		return	@"CommonMarkInlineTagSoftbreak";
		case	CommonMarkInlineTagLinebreak:		return	@"CommonMarkInlineTagLinebreak";
		case	CommonMarkInlineTagCode:			return	@"CommonMarkInlineTagCode";
		case	CommonMarkInlineTagRawHTML:			return	@"CommonMarkInlineTagRawHTML";
		case	CommonMarkInlineTagEntity:			return	@"CommonMarkInlineTagEntity";
		case	CommonMarkInlineTagEmphasis:		return	@"CommonMarkInlineTagEmphasis";
		case	CommonMarkInlineTagStrong:			return	@"CommonMarkInlineTagStrong";
		case	CommonMarkInlineTagLink:			return	@"CommonMarkInlineTagLink";
		case	CommonMarkInlineTagImage:			return	@"CommonMarkInlineTagImage";
	}
	fail_by_program_bug();
}











static inline NSArray*
add_prefix_to_lines(NSArray* lines, NSString* prefix)
{
	assert([prefix isKindOfClass:[NSString class]]);
	assert([lines isKindOfClass:[NSArray class]]);
	
	NSArray*	lns1	=	lines;
	NSArray*	lns2	=	@[];
	
	for (NSString* ln1 in lns1)
	{
		NSString*	ln2	=	[prefix stringByAppendingString:ln1];
		lns2	=	[lns2 arrayByAddingObject:ln2];
	}
	return	lns2;
}
static inline NSString*
add_prefix_to_lines_from_text(NSString* text, NSString* prefix)
{
	assert([text isKindOfClass:[NSString class]]);
	assert([prefix isKindOfClass:[NSString class]]);
	
	return	[add_prefix_to_lines([text componentsSeparatedByString:@"\n"], prefix) componentsJoinedByString:@"\n"];
}

static inline NSArray*
descriptions_of_items_in(NSArray* items)
{
	assert([items isKindOfClass:[NSArray class]]);
	
	NSArray*	ds2	=	@[];
	
	for (NSString* item in items)
	{
		NSString*	d2	=	[item description];
		ds2	=	[ds2 arrayByAddingObject:d2];
	}
	return	ds2;
}










static inline NSString*
always_nsstring_from_bstr(const_bstring raw)
{
	NSCAssert(raw != NULL, @"Input bstring shouldn't be NULL.");
	
	char*		s2	=	bstr2cstr(raw, '\0');
	NSString*	s3	=	[NSString stringWithUTF8String:s2];
	bcstrfree(s2);
	
	return	s3;
}
static inline NSString*
nsstring_from_bstr(const_bstring raw)
{
	return	raw == NULL ? nil : always_nsstring_from_bstr(raw);
}















