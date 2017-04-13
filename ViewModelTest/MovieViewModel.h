//
//  MovieViewModel.h
//  ViewModelTest
//
//  Created by GPF on 2017/4/13.
//  Copyright © 2017年 Damon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MovieModel.h"

typedef void(^ ReturnValueObject) (id returnValue);
typedef void(^ ErrorObject) (id errorValue);

@interface MovieViewModel : NSObject

@property (nonatomic, copy) ReturnValueObject returnBlock;
@property (nonatomic, copy) ErrorObject errorBlock;

- (void)getMovieData;
- (void)movieDetailWithPublicModel:(MovieModel *)model withViewController:(UIViewController *)currViewController;


@end
