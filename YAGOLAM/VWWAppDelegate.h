//
//  VWWAppDelegate.h
//  YAGOLAM
//
//  Created by Zakk Hoyt on 6/20/13.
//  Copyright (c) 2013 Zakk Hoyt. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface VWWAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (IBAction)saveAction:(id)sender;

@end
