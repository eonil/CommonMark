//
//  CommonMarkBlockList.h
//  Markdown
//
//  Created by Hoon H. on 9/8/14.
//  Copyright (c) 2014 Eonil. All rights reserved.
//

#import <Foundation/Foundation.h>

@class		CommonMarkBlock;




@interface	CommonMarkBlockList : NSObject
- (CommonMarkBlock*)firstBlock;
- (CommonMarkBlock*)lastBlock;
- (NSArray*)allBlocks;
@end
