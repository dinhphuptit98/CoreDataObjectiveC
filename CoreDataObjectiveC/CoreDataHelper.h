//
//  CoreDataHelper.h
//  CoreDataObjectiveC
//
//  Created by Admin on 8/12/18.
//  Copyright © 2018 PhuND12. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Person+CoreDataClass.h"
@class CoreDataHelper;
@interface CoreDataHelper : NSObject
+ (CoreDataHelper*)shared;
- (NSMutableArray *)getDataPerson;
- (void)innsertPerson: (NSString *)namePerson withAge:(int)agePerson with:(BOOL)sexPerson;
- (void)deleteFavoriteWith;
- (void)updatePerson: (NSString *)namePerson withAge:(int)agePerson with:(BOOL)sexPerson;
@end
