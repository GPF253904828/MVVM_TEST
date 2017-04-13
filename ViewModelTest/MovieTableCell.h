//
//  MovieTableCell.h
//  ViewModelTest
//
//  Created by GPF on 2017/4/13.
//  Copyright © 2017年 Damon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModel.h"

@interface MovieTableCell : UITableViewCell

- (void)refreshDataSource:(MovieModel *)model;

@end
