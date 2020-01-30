//
//  TodoItem.h
//  ObjectiveCLabb3
//
//  Created by Jonathan Thunberg on 2020-01-21.
//  Copyright © 2020 Jonathan Thunberg. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TodoItem : NSObject

@property (strong, nonatomic) NSString *itemName;
@property (strong, nonatomic) NSDate *itemDeadline;

- (instancetype)init;

- (instancetype)initWithName:(NSString *)itemName
itemDeadline:(NSDate *)itemDeadline;

@end

NS_ASSUME_NONNULL_END
