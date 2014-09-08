//
//  CommonMarkBlock.m
//  Markdown
//
//  Created by Hoon H. on 9/7/14.
//  Copyright (c) 2014 Eonil. All rights reserved.
//

#import "CommonMarkBlock.h"
#import "CommonMarkError.h"
#import "CommonMark__INTERNALS.h"
#import "CommonMark__INTERNAL_ENUM_MAPPINGS.h"
#import "CommonMark__INTERNAL_STRING_UTILITIES.h"



static inline void
report_error(int numline, NSString* message, CommonMarkError** error)
{
	if (error != NULL)
	{
		*error	=	[CommonMarkParsingError errorWithMessage:message lineNumber:numline];
	}
}



























@implementation CommonMarkBlock
+ (CommonMarkBlock*)CommonMark____instantiateWithRawBlockPointer:(block*)raw withRootBlock:(CommonMarkBlock *)root
{
	NSAssert(raw != NULL, @"Raw block pointer shouldn't be NULL.");
	NSAssert(root == nil || [root isKindOfClass:[CommonMarkBlock class]], @"Supplied root-block must be nil (in case of root itself) or a valid instance.");
	
	CommonMarkBlock*	b1	=	[super new];
	b1->_raw				=	raw;
	b1->_root				=	root;
	return	b1;
}
- (CommonMarkBlock *)CommonMark____rootBlock
{
	return	_root == NULL ? self : _root;
}

- (CommonMarkBlockTag)tag
{
	return	lookup_block_objc_tag(_raw->tag);
}
- (NSInteger)startLine
{
	return	_raw->start_line;
}
- (NSInteger)startColumn
{
	return	_raw->start_column;
}
- (NSInteger)endLine
{
	return	_raw->end_line;
}

- (NSArray *)allSubblocks
{
	CommonMarkBlockList*	l1	=	[self subblocks];
	CommonMarkBlock*		b1	=	[l1 firstBlock];
	
	if (l1 == nil)
	{
		return	@[];
	}
	
	NSArray*				a1	=	@[b1];
	while ((b1 = [b1 nextBlock]) != nil)
	{
		a1	=	[a1 arrayByAddingObject:b1];
	}
	
	return	a1;
}
- (CommonMarkBlockList *)subblocks
{
	CommonMarkBlock*		b0	=	rootblock_of(self);
	CommonMarkBlock*		b1	=	_raw->children == NULL ? nil : instantiate_block(_raw->children, b0);
	CommonMarkBlock*		b2	=	_raw->last_child == NULL ? nil : instantiate_block(_raw->last_child, b0);
	CommonMarkBlockList*	l1	=	(b1 == nil && b2 == nil) ? nil : [CommonMarkBlockList CommonMark____instantiateWithFirstBlock:b1 andLastBlock:b2];
	NSAssert((b1 == nil && b2 == nil) || (b1 != nil && b2 != nil), @"First and last child must be equally NULL or non-NULL.");
	return	l1;
}
- (CommonMarkBlock *)superblock
{
	return	instantiate_block(_raw->parent, rootblock_of(self));
}
- (NSString *)stringContent
{
	return	_raw->string_content == NULL ? nil : always_nsstring_from_bstr(_raw->string_content);
}
- (CommonMarkInline *)inlineContent
{
	return	inline_from_raw(_raw->inline_content);
}
- (CommonMarkInlineList *)inlines
{
	CommonMarkInline*		l1	=	inline_from_raw(_raw->inline_content);
	CommonMarkInlineList*	l2	=	inline_list_with_first(l1);
	return					l2	;
}
- (CommonMarkBlock *)priorBlock
{
	return	block_from_raw(_raw->prev, rootblock_of(self));
}
- (CommonMarkBlock *)nextBlock
{
	return	block_from_raw(_raw->next, rootblock_of(self));
}
- (NSString *)HTMLString
{
	bstring	output	=	NULL;
	bool	ok		=	blocks_to_html(_raw, &output, false) == 0;
	if (ok == false)
	{
		fail_by_program_bug();
	}
	else
	{
		NSString*	s1	=	nsstring_from_bstr(output);
		bool		ok1	=	bdestroy(output) != BSTR_ERR;
		assert(ok1);
		return		s1;
	}
}
- (NSString *)description
{
	NSString*	tag2	=	stringify_block_tag([self tag]);
	
	NSString*	inl2	=	[[self inlines] description];
	NSString*	inl3	=	inl2 == nil ? @"" : add_prefix_to_lines_from_text(inl2, @"  ");
	
	NSString*	sbs2	=	[[self subblocks] description];
	NSString*	sbs3	=	sbs2 == nil ? @"" : add_prefix_to_lines_from_text(sbs2, @"  ");
	
	return		[NSString stringWithFormat:@"%@:\n%@\n%@", tag2, inl3, sbs3];
}
@end

@implementation CommonMarkBlock (CommonMarkParsing)
+ (instancetype)blockWithString:(NSString *)string
{
	return	[self blockWithString:string error:NULL];
}
+ (instancetype)blockWithString:(NSString *)string error:(CommonMarkError *__autoreleasing *)error
{
	int			ln_num_base	=	1;
	
	NSArray*	lns1	=	[string componentsSeparatedByString:@"\n"];
	block*		blk1	=	make_document();
	int			c		=	(int)[lns1 count];
	should_be([lns1 count] <= INT_MAX);
	
	for (int i=0; i<c; i++)
	{
		NSString*	ln1		=	[lns1 objectAtIndex:i];
		NSString*	ln2		=	[ln1 stringByAppendingString:@"\n"];
		bstring		ln3		=	bfromcstr([ln2 UTF8String]);
		bool		ok1		=	incorporate_line(ln3, i+ln_num_base, &blk1) == 0;
		bool		ok2		=	bdestroy(ln3) != BSTR_ERR;
		should_be(ok2);
		if (ok1 == false)
		{
			report_error(i, [NSString stringWithFormat:@"error incorporating line %@", @(i)], error);
			//	it is unclear that we're fine to continue to next line on error state...
			free_blocks(blk1);
			return	nil;
		}
	}
	
	while (blk1 != blk1->top)
	{
		bool	ok1	=	finalize(blk1, c) == 0;
		should_be(ok1);
		
		blk1	=	blk1->parent;
	}
	
	bool	ok2	=	blk1 == blk1->top;
	if (ok2 == false)
	{
		report_error(c, @"problems finalizing open containers", error);
		//	it is unclear that we're fine to continue to next line on error state...
		free_blocks(blk1);
		return	nil;
	}
	
	bool	ok4	=	finalize(blk1, c) == 0;
	should_be(ok4);
	
	bool	ok3	=	process_inlines(blk1, blk1->attributes.refmap) == 0;
	should_be(ok3);
	
	////
	
	print_blocks(blk1, 4);
	
	return	instantiate_block(blk1, nil);
}

- (void)dealloc
{
	if (_root == nil)
	{
		free_blocks(_raw);
	}
}
@end






