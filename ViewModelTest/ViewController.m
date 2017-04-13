//
//  ViewController.m
//  ViewModelTest
//
//  Created by GPF on 2017/4/13.
//  Copyright © 2017年 Damon. All rights reserved.
//

#import "ViewController.h"
#import "MovieTableCell.h"
#import "MovieViewModel.h"

static NSString * cellID = @"cell_Movie_id";


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *dataSource;
    MovieViewModel * viewModel;
}
@property (nonatomic, strong)UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Movie";
    [self initUI];
    [self loadData];
}
- (void)loadData{
    dataSource = [NSMutableArray array];
    viewModel = [[MovieViewModel alloc] init];
    viewModel.returnBlock = ^(id returnValue) {
        NSArray * array = returnValue;
        dataSource = [NSMutableArray arrayWithArray:array];
    };
    [viewModel getMovieData];
}
- (void)initUI{
    [self.view addSubview:self.tableView];
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor grayColor];
        _tableView.rowHeight = 100;
        [_tableView registerClass:[MovieTableCell class] forCellReuseIdentifier:cellID];
    }
    return _tableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MovieTableCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    MovieModel *model = dataSource[indexPath.row];
    [cell refreshDataSource:model];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MovieModel *model = dataSource[indexPath.row];
    [viewModel movieDetailWithPublicModel:model withViewController:self];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
