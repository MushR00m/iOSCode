//
//  SomeTableViewCell2.m
//  CellAutoLayout
//
//  Created by chensongqi on 16/10/26.
//  Copyright © 2016年 chensongqi. All rights reserved.
//

#import "SomeTableViewCell2.h"

@implementation SomeTableViewCell2

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
     self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        NSString *someStr = @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. 那么这使得对于不同宽度的table view，我们都可以基于其宽度而得到cell的正确高度。 但是，我们不需要在-[tableView:cellForRowAtIndexPath]方法中做相同的处理，  因为，cell被用到table view中时，这是自动完成的。 也要注意，一些情况下，cell的最终宽度可能不等于table view的宽度  例如当table view的右边显示了section index的时候，必须要减去这个";

        UILabel *someLabel = [[UILabel alloc] init];
        someLabel.text =  someStr;
        someLabel.numberOfLines = 0;
        [self addSubview:someLabel];
        
        [someLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        [someLabel.topAnchor constraintEqualToAnchor:self.topAnchor constant:15.f].active = YES;
        [someLabel.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:15.f].active = YES;
        [someLabel.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-15.f].active = YES;
        [someLabel.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-15.f].active = YES;

    }
    return self;
}

@end
