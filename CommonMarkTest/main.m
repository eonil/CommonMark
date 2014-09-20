//
//  main.m
//  Markdown
//
//  Created by Hoon H. on 9/7/14.
//  Copyright (c) 2014 Eonil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EonilCommonMark.h"

int main(int argc, const char * argv[])
{
	@autoreleasepool
	{
		CommonMarkError*	e1	=	nil;
		CommonMarkBlock*	b1	=	[CommonMarkBlock blockWithString:@"TITLE\n====\n\nText with [link](address \"The Link\")." error:&e1];
		
		NSCAssert(e1 == nil, @":(");
		NSLog(@"%@", b1);
		NSLog(@"%@", [b1 HTMLRepresentationString]);
		
		////
		
//		for (CommonMarkBlock* b2 in [[b1 subblocks] allBlocks])
//		{
//			NSLog(@"%@", b2);
//		}
//		
//		////
//		
//		for (CommonMarkInline* i1 in  [[b1 inlines] allInlines])
//		{
//			NSLog(@"%@", i1);
//		}
	}
    return 0;
}
