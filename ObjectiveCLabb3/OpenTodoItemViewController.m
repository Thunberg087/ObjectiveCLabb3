//
//  OpenTodoItemViewController.m
//  ObjectiveCLabb3
//
//  Created by Jonathan Thunberg on 2020-01-21.
//  Copyright © 2020 Jonathan Thunberg. All rights reserved.
//

#import "OpenTodoItemViewController.h"

@interface OpenTodoItemViewController ()
@property (weak, nonatomic) IBOutlet UILabel *headline;
@property NSArray *todoArray;

@end

@implementation OpenTodoItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)viewWillAppear:(BOOL)animated {

    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    _todoArray = [prefs objectForKey:@"todoArray"];
    
    _headline.text = _todoArray[(int)_todoItemId][@"itemName"];
}


@end
