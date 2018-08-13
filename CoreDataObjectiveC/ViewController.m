//
//  ViewController.m
//  CoreDataObjectiveC
//
//  Created by Admin on 8/12/18.
//  Copyright © 2018 PhuND12. All rights reserved.
//

#import "ViewController.h"
#import "CoreDataHelper.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (weak, nonatomic) IBOutlet UITextField *ageText;
@property (weak, nonatomic) IBOutlet UISwitch *switchButton;
@property (weak, nonatomic) IBOutlet UILabel *sexLabel;
@property (assign,nonatomic) BOOL sex;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:true];
    self.nameText.text = self.nameDetail;
    self.ageText.text = [NSString stringWithFormat:@"%d",self.ageDetail];
    if (self.sexDetail == true){
        [self.switchButton isOn];
        self.sexLabel.text = @"Boy 100%";
    }else{
        self.switchButton.on = false;
        self.sexLabel.text = @"Girl 100%";
    }
    if (self.check == true){
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(editSucces:)];
    }else{
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(addSucces:)];
    }
}
- (void) addSucces: (id) sender{
    [self aleartAdd];
    NSString *namePerson = self.nameText.text;
    int agePerson = [self.ageText.text intValue];
    BOOL sexPerson = self.sex;
    [CoreDataHelper.shared innsertPerson:namePerson withAge:agePerson with:sexPerson];
}
- (void) editSucces: (id) sender{
    NSString *namePerson = self.nameText.text;
    int agePerson = [self.ageText.text intValue];
    BOOL sexPerson = self.sex;
    [CoreDataHelper.shared updatePerson:namePerson withAge:agePerson with:sexPerson];
    [self aleartEdit];
}
- (IBAction)switchButton:(UISwitch *)sender {
    if (sender.isOn){
        self.sexLabel.text = @"Boy 100%";
        self.sex = true;
    }else{
        self.sexLabel.text = @"Girl 100%";
        self.sex = false;
    }
}
-(void)aleartAdd{
    UIAlertController * alert=[UIAlertController alertControllerWithTitle:@"SAVE SUCCES" message:@"Add succes person to people"preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* okButton = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action)
                               {}];
    [alert addAction:okButton];
    [self presentViewController:alert animated:YES completion:nil];
}
-(void)aleartEdit{
    UIAlertController * alert=[UIAlertController alertControllerWithTitle:@"EDIT SUCCES" message:@"EDIT succes person in people"preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* okButton = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action)
                               {}];
    [alert addAction:okButton];
    [self presentViewController:alert animated:YES completion:nil];
}
@end

