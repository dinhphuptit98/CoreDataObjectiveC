//
//  TableViewController.m
//  CoreDataObjectiveC
//
//  Created by Admin on 8/12/18.
//  Copyright © 2018 PhuND12. All rights reserved.
//

#import "TableViewController.h"
#import "CoreDataHelper.h"
#import "TableViewCell.h"
#import "ViewController.h"
@interface TableViewController ()
@property (nonatomic,strong) NSMutableArray *listPerson;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"TableViewCell"];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:true];
    self.listPerson = [[NSMutableArray alloc] init];
    for (Person *person in [CoreDataHelper.shared getDataPerson]) {
        [self.listPerson addObject:person];
    }
    [self.tableView reloadData];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listPerson.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell" forIndexPath:indexPath];
    cell.namePerson.text = [self.listPerson[indexPath.row] name];
    cell.agePerson.text = [NSString stringWithFormat:@"%d",[self.listPerson[indexPath.row] age]];
    if ([self.listPerson[indexPath.row] sex] == true){
        cell.sexPerson.text = @"Boy 100%";
    }else{
        cell.sexPerson.text = @"Girl 100%";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [self.listPerson removeObjectAtIndex:indexPath.row];
        [tableView reloadData];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}

- (IBAction)addButton:(UIBarButtonItem *)sender {
    ViewController *detailMovieVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    [[self navigationController] pushViewController:detailMovieVC animated:YES];
    detailMovieVC.check = false;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ViewController *detailMovieVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    detailMovieVC.nameDetail = [self.listPerson[indexPath.row] name];
    detailMovieVC.ageDetail = [self.listPerson[indexPath.row] age];
    detailMovieVC.sexDetail = [self.listPerson[indexPath.row] sex];
    detailMovieVC.check = true;
    [[self navigationController] pushViewController:detailMovieVC animated:YES];
}

@end
