//
//  JALItemTableCell.m
//  JustAList
//
//  Created by Richard Mayer on 10/05/2011.
//  Copyright 2011 Richard Mayer. All rights reserved.
//

#import "JALItemTableCell.h"


@implementation JALItemTableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        NSLog(@"new JALItemTableCell");
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
