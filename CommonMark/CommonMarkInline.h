//
//  CommonMarkInline.h
//  Markdown
//
//  Created by Hoon H. on 9/7/14.
//  Copyright (c) 2014 Eonil. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, CommonMarkInlineTag)
{
	CommonMarkInlineTagString,
	CommonMarkInlineTagSoftbreak,
	CommonMarkInlineTagLinebreak,
	CommonMarkInlineTagCode,
	CommonMarkInlineTagRawHTML,
	CommonMarkInlineTagEntity,
	CommonMarkInlineTagEmphasis,
	CommonMarkInlineTagStrong,
	CommonMarkInlineTagLink,
	CommonMarkInlineTagImage,
};


@class		CommonMarkInlineList;

/*!
 Singly linked list.
 */
@interface	CommonMarkInline : NSObject
@property	(readonly,nonatomic,assign)		CommonMarkInlineTag		tag;
- (CommonMarkInline*)nextInline;

//- (id)		content;						///<	One of @c NSString\, @c CommonMarkLinkabe\, @c CommonMarkInlineList or @c nil by the tag.
- (CommonMarkInlineList*)subinlines;		///<	Exists when tag is one of string, raw-HTML, code or entity.
- (id)		linkage;						///<	Exists when tag is one of link or image.
- (NSString*)literal;						///<	Exists when tag is one of emphasis or strong.
@end

//@interface	CommonMarkLiteralContent : NSObject
//@end
//
//@interface	CommonMarkInlinesContent : NSObject
//@end
//
//@interface	CommonMarkLinkableContent : NSObject
//@end
