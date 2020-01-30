//
//  TodoTableViewCell.m
//  ObjectiveCLabb3
//
//  Created by Jonathan Thunberg on 2020-01-27.
//  Copyright © 2020 Jonathan Thunberg. All rights reserved.
//

#import "TodoTableViewCell.h"

@implementation TodoTableViewCell

@synthesize dateLabel = _dateLabel;
@synthesize nameLabel = _nameLabel;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
