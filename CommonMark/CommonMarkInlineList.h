//
//  CommonMarkInlineList.h
//  Markdown
//
//  Created by Hoon H. on 9/8/14.
//  Copyright (c) 2014 Eonil. All rights reserved.
//

#import <Foundation/Foundation.h>


@class		CommonMarkInline;

@interface	CommonMarkInlineList : NSObject
- (CommonMarkInline*)firstInline;
- (NSArray*)allInlines;
@end
