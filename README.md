README
======
Hoon H., 2014/09/07








Getting Started
---------------

1.	Add "CommonMark.xcproj" as a subproject of your project.
2.	Add a proper "Static Framework" for your target OS.
	Take care that all these targets are static libraries, 
	and you don't have to copy them into the final product 
	bundle. And this also can be used for iOS 7.0 or earlier.
3.	Don't forget to add `-ObjC` to "Other Linker Flags"!





How to Use
----------
Major features are incorported in `CommonMarkBlock` class.
Instnatiate the class to build a document tree.

	CommonMarkError*	e1	=	nil;
	CommonMarkBlock*	b1	=	[CommonMarkBlock blockWithString:@"Foo\n---------------\n\naa*bb*cc**dd**ee" error:&e1];

	NSLog(@"%@", b1);
	NSLog(@"%@", [b1 HTMLString]);

You can navigate subnodes using methods of the class.

	for (CommonMarkBlock* b2 in [[b1 subblocks] allBlocks])
	{
		NSLog(@"%@", b2);
	}

Also inlines.

	for (CommonMarkInline* i1 in  [[b1 inlines] allInlines])
	{
		NSLog(@"%@", i1);
	}








Caveats
-------
You should keep the root block (document) alive to use
any subnode blocks. All the subnode blocks will be invalidated
when you deallocate the root block.

All the blocks are proxy objects to raw pointers and built as
value-semantics. It's meaningless comparing pointers for 
identity. 










License
-------
The "CommonMark" source code is written by John MacFarlane
and licensed under BSD license.
Objective-C wrapper classes are written by Hoon H., and also
licensed under BSD license.

"CommonMark" source files are embedded for simple and stable
build by avoiding extra dependencies and procedures. If you 
want the latest original source, please visit 
[CommonMark](http://commonmark.org).






