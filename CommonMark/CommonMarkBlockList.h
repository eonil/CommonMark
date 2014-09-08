//
//  CommonMarkBlockList.h
//  Markdown
//
//  Created by Hoon H. on 9/8/14.
//  Copyright (c) 2014 Eonil. All rights reserved.
//

#import "CommonMarkProxyObject.h"

@class		CommonMarkBlock;



/*!
 @note
 Blocks list is a doubly linked list.
 */
@interface	CommonMarkBlockList : CommonMarkProxyObject
- (CommonMarkBlock*)firstBlock;
- (CommonMarkBlock*)lastBlock;
- (NSArray*)allBlocks;
@end
