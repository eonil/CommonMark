//
//  CommonMarkSubject.h
//  Markdown
//
//  Created by Hoon H. on 9/7/14.
//  Copyright (c) 2014 Eonil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface	CommonMarkSubject : NSObject
@property	(readonly,nonatomic,copy)	NSString*		buffer;
@property	(readonly,nonatomic,assign)	int				position;
@property	(readonly,nonatomic,copy)	id				referenceMap;
@property	(readonly,nonatomic,assign)	int				labelNestLevel;
@end
