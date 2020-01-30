//
//  TodoViewController.m
//  ObjectiveCLabb3
//
//  Created by Jonathan Thunberg on 2020-01-20.
//  Copyright © 2020 Jonathan Thunberg. All rights reserved.
//

#import "TodoViewController.h"
#import "OpenTodoItemViewController.h"
#import "TodoTableViewCell.h"


@interface TodoViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (copy) NSMutableArray *todoArray;
@property (copy) NSMutableArray *doneArray;
@property (nonatomic, strong) NSMutableArray *sections;


@end

@implementation TodoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    _sections = [[NSMutableArray  alloc] init];

     [_sections addObject:@"Pågående"];
     [_sections addObject:@"Färdiga"];
    
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

- (void)viewWillAppear:(BOOL)animated{
    // Border radius
    [_addButton.layer setCornerRadius:25.0f];

    // Drop shadow
    [_addButton.layer setShadowColor:[UIColor blackColor].CGColor];
    [_addButton.layer setShadowOpacity:0.3];
    [_addButton.layer setShadowRadius:3.0];
    [_addButton.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
   
    
    
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    _todoArray = [[prefs objectForKey:@"todoArray"] mutableCopy];
    
    
    if ([prefs objectForKey:@"doneArray"] == NULL) {
        _doneArray = [@[] mutableCopy];
    } else {
        _doneArray = [[prefs objectForKey:@"doneArray"] mutableCopy];
    }
     
    [self.tableView reloadData];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
 // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
 // Return the number of rows in the section.
    int number = 0;

    if (section == 0) {
        number = _todoArray.count;
    } else if (section == 1){
        number = _doneArray.count;
    }
    return number;
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [_sections objectAtIndex:section];
}


- (UITableViewCell *)tableView:(UITableView *)tableView
 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *CellIdentifier = @"TodoCell";
    TodoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

        if (indexPath.section == 0) {
             cell.nameLabel.text = _todoArray[indexPath.row][@"itemName"];
            
            NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            NSString *dateText = [dateFormatter stringFromDate:_todoArray[indexPath.row][@"itemDeadline"]];
            
             cell.dateLabel.text = dateText;


            if (_todoArray[indexPath.row][@"isImportant"]  == @YES) {
                cell.backgroundColor = [UIColor colorWithRed: 100.0/255.0f green:226.0/255.0f blue:245.0/255.0f alpha:0.5];
            } else {
                cell.backgroundColor = [UIColor whiteColor];
            }
    } else if (indexPath.section == 1) {
            cell.nameLabel.text = _doneArray[indexPath.row][@"itemName"];
            
            NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            NSString *dateText = [dateFormatter stringFromDate:_doneArray[indexPath.row][@"itemDeadline"]];
            
             cell.dateLabel.text = dateText;


            if (_doneArray[indexPath.row][@"isImportant"] == @YES) {
                cell.backgroundColor = [UIColor colorWithRed: 100.0/255.0f green:226.0/255.0f blue:245.0/255.0f alpha:0.5];
            } else {
                cell.backgroundColor = [UIColor whiteColor];
            }
    }

    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//     
//    [self openTodoItem:(int)indexPath.row];
//}
//
//
//-(void)openTodoItem:(int)todoItemId
//{
//
//    OpenTodoItemViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"OpenTodoItemViewController"];
//
//    viewController.todoItemId = todoItemId;
//
//    [self presentViewController:viewController animated:YES completion:nil];
//
//}


-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {


        UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Delete"  handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
            
            [self deleteItem:(int)indexPath.row sectionNumber:(int)indexPath.section];
            
        }];
        deleteAction.backgroundColor = [UIColor redColor];
    
        UITableViewRowAction *editAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Mark as done" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){

            [self markAsDone:(int)indexPath.row];

        }];
        editAction.backgroundColor = [UIColor colorWithRed: 72.0/255.0f green:196.0/255.0f blue:47.0/255.0f alpha:1.0];

    
    
        if (indexPath.section == 0) {
            return @[editAction, deleteAction];
        } else {
            return @[deleteAction];
        }
}


-(void)deleteItem:(int)todoItemId sectionNumber:(int)sectionNumber {
    NSLog(@"%ld", sectionNumber);
    if (sectionNumber == 0) {
        [_todoArray removeObjectAtIndex:todoItemId];
        [_tableView reloadData];
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:_todoArray forKey:@"todoArray"];
        [userDefaults synchronize];
    } else if (sectionNumber == 1) {
        [_doneArray removeObjectAtIndex:todoItemId];
        [_tableView reloadData];
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:_doneArray forKey:@"doneArray"];
        [userDefaults synchronize];
    }

}


-(void)markAsDone:(int)todoItemId {
        
    [_doneArray addObject:_todoArray[todoItemId]];
    [_todoArray removeObjectAtIndex:todoItemId];
    [_tableView reloadData];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:_todoArray forKey:@"todoArray"];
    [userDefaults setObject:_doneArray forKey:@"doneArray"];
    [userDefaults synchronize];

}


@end
