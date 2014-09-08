//
//  CommonMarkInlineList.h
//  Markdown
//
//  Created by Hoon H. on 9/8/14.
//  Copyright (c) 2014 Eonil. All rights reserved.
//

#import "CommonMarkProxyObject.h"


@class		CommonMarkInline;

/*!
 @note
 Inline list is a singly linked forward list. (ftont to back)
 */
@interface	CommonMarkInlineList : CommonMarkProxyObject
- (CommonMarkInline*)firstInline;
- (NSArray*)allInlines;
@end
