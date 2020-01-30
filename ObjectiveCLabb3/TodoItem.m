//
//  TodoItem.m
//  ObjectiveCLabb3
//
//  Created by Jonathan Thunberg on 2020-01-21.
//  Copyright © 2020 Jonathan Thunberg. All rights reserved.
//

#import "TodoItem.h"

@implementation TodoItem



- (instancetype)init {
   
    NSString *str = [NSString stringWithFormat:@"2011-01-13T17:00:00+11:00"];

    // convert to date
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    // ignore +11 and use timezone name instead of seconds from gmt
    [dateFormat setDateFormat:@"YYYY-MM-dd'T'HH:mm:ss'+11:00'"];
    [dateFormat setTimeZone:[NSTimeZone timeZoneWithName:@"Australia/Melbourne"]];
    NSDate *dte = [dateFormat dateFromString:str];
    
    self = [self initWithName:@"awd" itemDeadline:dte];
    return self;
}

- (instancetype)initWithName:(NSString *)itemName itemDeadline:(NSDate *)itemDeadline
{
 self = [super init];
    
 if (self) {
     _itemName = itemName;
     _itemDeadline = itemDeadline;
 }
 return self;
}

@end
