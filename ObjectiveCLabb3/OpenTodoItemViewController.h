//
//  OpenTodoItemViewController.h
//  ObjectiveCLabb3
//
//  Created by Jonathan Thunberg on 2020-01-21.
//  Copyright © 2020 Jonathan Thunberg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TodoViewController.h"

NS_ASSUME_NONNULL_BEGIN

@class TodoViewController;

@interface OpenTodoItemViewController : UIViewController

@property (nonatomic, assign) int todoItemId;

@end

NS_ASSUME_NONNULL_END
