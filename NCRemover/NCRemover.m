//
//  NCRemover.m
//  NCRemover
//
//  Created by Andrés Botero on 7/7/13.
//  Copyright (c) 2013 BoteRock. All rights reserved.
//

#import "NCRemover.h"

@implementation NCRemover


/**
 * A special method called by SIMBL once the application has started and all classes are initialized.
 */
+ (void) load
{
	NCRemover* remover = [NCRemover sharedInstance];
	// ... do whatever
	NSLog(@"MySamplePlugin installed");
	
	NSStatusBar *statusBar = [NSStatusBar systemStatusBar];

	id items = [statusBar valueForKey:@"_items"];
	unsigned long count = [items count];

	//NSLog(@"%@", items);

	//NSArray *array = [_menu itemArray];

	for (int i = 0; i<count; i++) {


		void* voidptr = [items pointerAtIndex:i];

		NSLog(@"void ptr: %d", voidptr);

		id test = (__bridge id)(voidptr);

		NSLog(@"id: %@", test);
		
		NSStatusItem *statusItem = test;
		
		if([statusItem isKindOfClass:[NSStatusItem class] ])
		{
			
			//remove item
			//[statusBar removeStatusItem:statusItem];
			
			//little padding to the right, almost hidden, shows little dots from cropping original icon
			[statusItem setLength:10.f];
			//[statusItem setImage:nil];
			//[statusItem setAlternateImage:nil];
			
//			SEL action = [statusItem action];
//			id target = [statusItem target];
			
			
			//create new item
			
			//at first I tried creating new menu item, but it suddely disappeared, removing the padding to the right
			
//			NSStatusItem* newItem = [statusBar statusItemWithLength:NSVariableStatusItemLength];
//			newItem.length = 10.0f;
//			newItem.highlightMode = YES;
//			[newItem setAction:action];
//			[newItem setTarget:target];
//
			
			//so at last I decided to keep the statusItem and change the view
			
			NSView *view = [[NSView alloc]initWithFrame:NSMakeRect(0, 0, 10, 20)];
//			
//			[newItem setView:view];
//			
//			
			[statusItem setView:view];
			
			
		}
		
	}

	
}

/**
 * @return the single static instance of the plugin object
 */
+ (NCRemover*) sharedInstance
{
	static NCRemover* plugin = nil;
	
	if (plugin == nil)
		plugin = [[NCRemover alloc] init];
	
	return plugin;
}

@end
