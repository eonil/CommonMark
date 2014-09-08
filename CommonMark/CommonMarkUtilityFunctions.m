//
//  CommonMarkUtilityFunctions.m
//  CommonMark
//
//  Created by Hoon H. on 9/8/14.
//  Copyright (c) 2014 Eonil. All rights reserved.
//

#import "CommonMarkUtilityFunctions.h"
#import "CommonMark__INTERNALS.h"

extern NSString*
NSStringFromCommonMarkBlockTag(CommonMarkBlockTag tag)
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



extern NSString*
NSStringFromCommonMarkInlineTag(CommonMarkInlineTag tag)
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