//
//  AppDelegate.h
//  FundCenter
//
//  Created by DP on 15/5/10.
//  Copyright (c) 2015年 QXL&DP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

#import "RDVTabBarController.h"
#import "RDVTabBarItem.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic, strong) RDVTabBarController *tabBarVC;


- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

