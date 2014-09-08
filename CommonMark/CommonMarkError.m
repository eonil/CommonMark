//
//  CommonMarkError.m
//  Markdown
//
//  Created by Hoon H. on 9/8/14.
//  Copyright (c) 2014 Eonil. All rights reserved.
//

#import "CommonMarkError.h"




NSString* const	CommonMarkErrorDomain			=	@"CommonMarkErrorDomain";
NSInteger const	CommonMarkErrorCodeParsing		=	1;

NSString* const	CommonMarkErrorLineNumberKey	=	@"CommonMarkErrorLineNumberKey";



@implementation CommonMarkError
@end

@implementation CommonMarkParsingError
+ (instancetype)errorWithMessage:(NSString *)message lineNumber:(NSInteger)lineNumber
{
	NSDictionary*	d1	=	@
	{
		NSLocalizedDescriptionKey		:	message,
		CommonMarkErrorLineNumberKey	:	@(lineNumber),
	};
	
	return	[super errorWithDomain:CommonMarkErrorDomain code:CommonMarkErrorCodeParsing userInfo:d1];
}
- (NSInteger)lineNumber
{
	return	[[[self userInfo] objectForKey:CommonMarkErrorLineNumberKey] integerValue];
}
@end
