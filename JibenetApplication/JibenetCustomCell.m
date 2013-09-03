//
//  AppDelegate.h
//  JibenetApplication
//
//  Created by Raj on 12/08/13.
//  Copyright (c) 2013 Raj. All rights reserved.
//

#import "JibenetCustomCell.h"

@implementation JibenetCustomCell
@synthesize lblName,lblAddress,lblRate,lblSize,dataImage;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
