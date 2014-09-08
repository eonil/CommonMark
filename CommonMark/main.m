//
//  main.m
//  Markdown
//
//  Created by Hoon H. on 9/7/14.
//  Copyright (c) 2014 Eonil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommonMark.h"

int main(int argc, const char * argv[])
{
	@autoreleasepool
	{
		CommonMarkError*	e1	=	nil;
		CommonMarkBlock*	b1	=	[CommonMarkBlock blockWithString:@"Foo\n---------------\n\naa*bb*cc**dd**ee" error:&e1];
		
		NSLog(@"%@", b1);
		NSLog(@"%@", [b1 HTMLString]);
	}
    return 0;
}
