//
//  CoreDataHelper.m
//  CoreDataObjectiveC
//
//  Created by Admin on 8/12/18.
//  Copyright © 2018 PhuND12. All rights reserved.
//

#import "CoreDataHelper.h"
#import "AppDelegate.h"
@implementation CoreDataHelper
+ (CoreDataHelper*)shared {
    static dispatch_once_t predicate = 0;
    __strong static id sharedObject = nil;
    dispatch_once(&predicate, ^{
        sharedObject = [[self alloc] init];
    });
    return sharedObject;
}
//get Data
- (NSArray *)getDataPerson {
    
    NSManagedObjectContext *context = [[AppDelegate shared] persistentContainer].viewContext;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    fetchRequest.returnsObjectsAsFaults = false;
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSArray *objectsFecth = [context executeFetchRequest:fetchRequest error:nil];
    return objectsFecth;
}
// Add Person vao mang people 
- (void)innsertPerson: (NSString *)namePerson withAge:(int)agePerson with:(BOOL)sexPerson{
    NSError *error;
    NSManagedObjectContext *context = [[AppDelegate shared] persistentContainer].viewContext;
    Person *entity = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:context];
    entity.name = namePerson;
    entity.age = agePerson;
    entity.sex = sexPerson;
    if (![context save:&error]) {
        NSLog(@"Failed to save - error: %@", [error localizedDescription]);
    }
}
//Delete Person in People

@end

