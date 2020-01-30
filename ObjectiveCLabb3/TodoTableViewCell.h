//
//  TodoTableViewCell.h
//  ObjectiveCLabb3
//
//  Created by Jonathan Thunberg on 2020-01-27.
//  Copyright © 2020 Jonathan Thunberg. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TodoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

NS_ASSUME_NONNULL_END
