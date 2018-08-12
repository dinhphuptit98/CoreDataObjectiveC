//
//  AppDelegate.h
//  CoreDataObjectiveC
//
//  Created by Admin on 8/12/18.
//  Copyright © 2018 PhuND12. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;
@property (readonly, strong) NSPersistentContainer *persistentContainer;
- (void)saveContext;
+ (AppDelegate*)shared;

@end

