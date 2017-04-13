//
//  MovieViewModel.m
//  ViewModelTest
//
//  Created by GPF on 2017/4/13.
//  Copyright © 2017年 Damon. All rights reserved.
//

#import "MovieViewModel.h"

@interface MovieViewModel ()

@property (nonatomic, strong)UIViewController *vc;

@end

@implementation MovieViewModel


- (void)getMovieData{//network requestGI
    NSMutableArray *array = [NSMutableArray array];
    for (int i=0 ; i<10; i++) {
        MovieModel *model = [[MovieModel alloc] init];
        model.title = [NSString stringWithFormat:@"TITLE_%d",i];
        model.content = [NSString stringWithFormat:@"CONTENT_%d",i];
        [array addObject:model];
    }
    _returnBlock(array);
}
- (void)movieDetailWithPublicModel:(MovieModel *)model withViewController:(UIViewController *)currViewController{
    UIViewController *movieDetailController = [[UIViewController alloc] init];
    movieDetailController.view.backgroundColor = [UIColor grayColor];
    UIButton * button =[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 100);
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundColor:[UIColor redColor]];
    [movieDetailController.view addSubview:button];
    movieDetailController.title = model.title;
    [currViewController presentViewController:movieDetailController animated:YES completion:nil ];
    self.vc = movieDetailController;
}

- (void)buttonClick{
    [self.vc dismissViewControllerAnimated:YES completion:nil];
}

@end
