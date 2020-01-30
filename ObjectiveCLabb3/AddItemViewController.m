//
//  AddItemViewController.m
//  ObjectiveCLabb3
//
//  Created by Jonathan Thunberg on 2020-01-20.
//  Copyright © 2020 Jonathan Thunberg. All rights reserved.
//

#import "AddItemViewController.h"
#import "TodoItem.h"

@interface AddItemViewController ()

@property (weak, nonatomic) IBOutlet UIButton *addItemButton;

@property (weak, nonatomic) IBOutlet UIDatePicker *deadlineDatePicker;

@property (weak, nonatomic) IBOutlet UITextField *itemName;

@property (weak, nonatomic) IBOutlet UISwitch *itemIsImportantSwitch;


@property (nonatomic) NSMutableArray *todoItemArray;


@end

@implementation AddItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    


}


-(void)viewWillAppear:(BOOL)animated {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

  
    
    if ([userDefaults objectForKey:@"todoArray"] == NULL) {
        self.todoItemArray = [@[] mutableCopy];
    } else {
        self.todoItemArray = [[userDefaults objectForKey:@"todoArray"] mutableCopy];
    }
    


}


- (IBAction)onClickAddItemButton:(id)sender {
    

    NSMutableDictionary *newItem = [@{ @"itemName" : _itemName.text, @"itemDeadline" : _deadlineDatePicker.date, @"isImportant" : @(_itemIsImportantSwitch.on)} mutableCopy];
        
    [self.todoItemArray addObject:newItem];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:self.todoItemArray forKey:@"todoArray"];
    [userDefaults synchronize];


    [self.navigationController popToRootViewControllerAnimated:YES];

}


- (void)resetDefaults {
    NSUserDefaults * defs = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary * dict = [defs dictionaryRepresentation];
    for (id key in dict) {
        [defs removeObjectForKey:key];
    }
    [defs synchronize];
}




@end
