//
//  CommonMark__INTERNALS.h
//  Markdown
//
//  Created by Hoon H. on 9/8/14.
//  Copyright (c) 2014 Eonil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "stmd/stmd.h"
#import "CommonMarkBlockList.h"
#import "CommonMarkBlock.h"
#import "CommonMarkInline.h"
#import "CommonMarkInlineList.h"

@interface	CommonMarkBlockList ()
+ (instancetype)CommonMark____instantiateWithFirstBlock:(CommonMarkBlock*)firstBlock andLastBlock:(CommonMarkBlock*)lastBlock;
@end

@interface	CommonMarkBlock ()
{
	@package
	block*				_raw;
	CommonMarkBlock*	_root;		//	non-nil only if this is non-root not to make self-cycle.
}
+ (CommonMarkBlock*)CommonMark____instantiateWithRawBlockPointer:(block*)raw withRootBlock:(CommonMarkBlock*)root;
- (CommonMarkBlock*)CommonMark____rootBlock;
@end

@interface	CommonMarkInline ()
+ (instancetype)CommonMark____instantiateWithRawPointer:(inl*)raw;
@end

@interface	CommonMarkInlineList ()
+ (instancetype)CommonMark____instantiateWithFirstInline:(CommonMarkInline*)first;
@end










__attribute__((noreturn))
static inline void
fail_by_program_bug()
{
	abort();
}

/*!
 Crashes if not OK at runtime.
 */
static inline void
should_be(bool cond)
{
	if (cond == false)
	{
		fail_by_program_bug();
	}
}







static inline CommonMarkBlock*
instantiate_block(block* raw, CommonMarkBlock* root)
{
	return	[CommonMarkBlock CommonMark____instantiateWithRawBlockPointer:raw withRootBlock:root];
}
static inline CommonMarkBlock*
rootblock_of(CommonMarkBlock* block)
{
	return	[block CommonMark____rootBlock];
}
static inline CommonMarkBlockList*
instantiate_block_list(CommonMarkBlock* first, CommonMarkBlock* last)
{
	return	[CommonMarkBlockList CommonMark____instantiateWithFirstBlock:first andLastBlock:last];
}













/*!
 @param	root	Can be @c nil\.
 */
static inline CommonMarkBlock*
block_from_raw(block* raw, CommonMarkBlock* root)
{
	return	raw == NULL ? nil : [CommonMarkBlock CommonMark____instantiateWithRawBlockPointer:raw withRootBlock:root];
}

static inline CommonMarkInline*
inline_from_raw(inl* raw)
{
	return	raw == NULL ? nil : [CommonMarkInline CommonMark____instantiateWithRawPointer:raw];
}

static inline CommonMarkInlineList*
inline_list_with_first(CommonMarkInline* first)
{
	return	first == nil ? nil : [CommonMarkInlineList CommonMark____instantiateWithFirstInline:first];
}





















