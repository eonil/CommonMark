//
//  CommonMarkReference.h
//  Markdown
//
//  Created by Hoon H. on 9/7/14.
//  Copyright (c) 2014 Eonil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface	CommonMarkReference : NSObject
@property	(readonly,nonatomic,copy)	NSString*		label;
@property	(readonly,nonatomic,copy)	NSString*		URL;
@property	(readonly,nonatomic,copy)	NSString*		title;
//@property	(readonly,nonatomic,copy)	id				hashHandle;
@end

