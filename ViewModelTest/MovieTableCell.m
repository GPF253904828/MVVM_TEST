//
//  MovieTableCell.m
//  ViewModelTest
//
//  Created by GPF on 2017/4/13.
//  Copyright © 2017年 Damon. All rights reserved.
//

#import "MovieTableCell.h"

@implementation MovieTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)refreshDataSource:(MovieModel *)model{
    
    self.textLabel.text = model.title;
    self.detailTextLabel.text = model.content;
    self.imageView.image = [UIImage imageNamed:@"0"];
    
}

@end
