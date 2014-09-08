//
//  CommonMarkError.h
//  Markdown
//
//  Created by Hoon H. on 9/8/14.
//  Copyright (c) 2014 Eonil. All rights reserved.
//

#import <Foundation/Foundation.h>


extern NSString* const	CommonMarkErrorDomain;
extern NSInteger const	CommonMarkErrorCodeParsing;

extern NSString* const	CommonMarkErrorLineNumberKey;



@interface CommonMarkError : NSError
@end

@interface	CommonMarkParsingError : CommonMarkError
+ (instancetype)errorWithMessage:(NSString*)message lineNumber:(NSInteger)lineNumber;
+ (instancetype)errorWithDomain:(NSString *)domain code:(NSInteger)code userInfo:(NSDictionary *)dict NS_UNAVAILABLE;
- (NSInteger)lineNumber;
@end