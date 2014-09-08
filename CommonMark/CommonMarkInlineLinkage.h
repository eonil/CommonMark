//
//  CommonMarkInlineLinkage.h
//  CommonMark
//
//  Created by Hoon H. on 9/8/14.
//  Copyright (c) 2014 Eonil. All rights reserved.
//

#import "CommonMarkProxyObject.h"



@class		CommonMarkInlineList;

@interface	CommonMarkInlineLinkage : CommonMarkProxyObject
@property	(readonly,nonatomic,strong)		CommonMarkInlineList*	subinlines;		///<	Label text content.
@property	(readonly,nonatomic,copy)		NSString*				address;		///<	URL or any string expression.
@property	(readonly,nonatomic,copy)		NSString*				title;
@end
