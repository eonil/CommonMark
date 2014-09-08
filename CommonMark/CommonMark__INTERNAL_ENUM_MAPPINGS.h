//
//  CommonMark__INTERNAL_ENUM_MAPPINGS.h
//  Markdown
//
//  Created by Hoon H. on 9/8/14.
//  Copyright (c) 2014 Eonil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "stmd/stmd.h"
#import "CommonMarkBlock.h"
#import "CommonMarkInline.h"
#import "CommonMark__INTERNALS.h"

static inline CommonMarkBlockTag
lookup_block_objc_tag(int block_tag)
{
	switch (block_tag)
	{
		case	document:		return	CommonMarkBlockTagDocument;
		case	block_quote:	return	CommonMarkBlockTagBlockQuote;
		case	list:			return	CommonMarkBlockTagList;
		case	list_item:		return	CommonMarkBlockTagListItem;
		case	fenced_code:	return	CommonMarkBlockTagFencedCode;
		case	indented_code:	return	CommonMarkBlockTagIndentedCode;
		case	html_block:		return	CommonMarkBlockTagHTMLBlock;
		case	paragraph:		return	CommonMarkBlockTagParagraph;
		case	atx_header:		return	CommonMarkBlockTagATXHeader;
		case	setext_header:	return	CommonMarkBlockTagSetEXTHeader;
		case	hrule:			return	CommonMarkBlockTagHRule;
		case	reference_def:	return	CommonMarkBlockTagReferenceDef;
	}
	fail_by_program_bug();
}

static inline CommonMarkInlineTag
lookup_inline_objc_tag(int inline_tag)
{
	switch (inline_tag)
	{
		case	str:		return	CommonMarkInlineTagString;
		case	softbreak:	return	CommonMarkInlineTagSoftbreak;
		case	linebreak:	return	CommonMarkInlineTagLinebreak;
		case	code:		return	CommonMarkInlineTagCode;
		case	raw_html:	return	CommonMarkInlineTagRawHTML;
		case	entity:		return	CommonMarkInlineTagEntity;
		case	emph:		return	CommonMarkInlineTagEmphasis;
		case	strong:		return	CommonMarkInlineTagStrong;
		case	link:		return	CommonMarkInlineTagLink;
		case	image:		return	CommonMarkInlineTagImage;
	}
	fail_by_program_bug();
}

