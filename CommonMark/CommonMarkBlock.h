//
//  CommonMarkBlock.h
//  Markdown
//
//  Created by Hoon H. on 9/7/14.
//  Copyright (c) 2014 Eonil. All rights reserved.
//

#import "CommonMarkProxyObject.h"

@class		CommonMarkError;
@class		CommonMarkInlineList;
@class		CommonMarkBlockList;




typedef NS_ENUM(NSUInteger, CommonMarkBlockTag)
{
	CommonMarkBlockTagDocument,
	CommonMarkBlockTagBlockQuote,
	CommonMarkBlockTagList,
	CommonMarkBlockTagListItem,
	CommonMarkBlockTagFencedCode,
	CommonMarkBlockTagIndentedCode,
	CommonMarkBlockTagHTMLBlock,
	CommonMarkBlockTagParagraph,
	CommonMarkBlockTagATXHeader,
	CommonMarkBlockTagSetEXTHeader,
	CommonMarkBlockTagHRule,
	CommonMarkBlockTagReferenceDef,
};

@interface	CommonMarkBlock : CommonMarkProxyObject
@property	(readonly,nonatomic,assign)		CommonMarkBlockTag		tag;
@property	(readonly,nonatomic,assign)		NSInteger				startLine;
@property	(readonly,nonatomic,assign)		NSInteger				startColumn;
@property	(readonly,nonatomic,assign)		NSInteger				endLine;
- (CommonMarkBlockList*)subblocks;
- (CommonMarkBlock*)superblock;
- (CommonMarkInlineList*)inlines;
- (CommonMarkBlock*)priorBlock;
- (CommonMarkBlock*)nextBlock;
- (NSString*)HTMLRepresentationString;

- (id)copy NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)alloc NS_UNAVAILABLE;
+ (instancetype)allocWithZone:(struct _NSZone *)zone NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;
@end

@interface	CommonMarkBlock (CommonMarkParsing)
/*!
 Instantiate a block by parsing Markdown string.
 */
+ (instancetype)blockWithString:(NSString*)string error:(CommonMarkError**)error;
+ (instancetype)blockWithString:(NSString*)string;
@end

@interface	CommonMarkBlock (CommonMarkBlockAttributes)
//- (CommonMarkBlockListData*)listData;
//- (CommonMarkBlockFencedCodeData*)fencedCodeData;
- (NSDictionary*)referenceMap;
- (NSUInteger)headerLevel;
@end































