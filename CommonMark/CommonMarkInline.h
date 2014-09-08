//
//  CommonMarkInline.h
//  Markdown
//
//  Created by Hoon H. on 9/7/14.
//  Copyright (c) 2014 Eonil. All rights reserved.
//

#import "CommonMarkProxyObject.h"

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
@class		CommonMarkInlineLinkage;





@interface	CommonMarkInline : CommonMarkProxyObject
@property	(readonly,nonatomic,assign)		CommonMarkInlineTag		tag;
- (CommonMarkInline*)nextInline;

- (CommonMarkInlineList*)subinlines;		///<	Non-nil value when tag is one of string, raw-HTML, code or entity.
- (CommonMarkInlineLinkage*)linkage;						///<	Non-nil value when tag is one of link or image.
- (NSString*)literal;						///<	Non-nil value when tag is one of emphasis or strong.
@end
