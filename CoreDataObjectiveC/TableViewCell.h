//
//  TableViewCell.h
//  CoreDataObjectiveC
//
//  Created by Admin on 8/12/18.
//  Copyright © 2018 PhuND12. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *namePerson;
@property (weak, nonatomic) IBOutlet UILabel *agePerson;
@property (weak, nonatomic) IBOutlet UILabel *sexPerson;

@end
