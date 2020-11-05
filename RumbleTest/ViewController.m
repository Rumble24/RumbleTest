//
//  ViewController.m
//  RumbleTest
//
//  Created by 王景伟 on 2020/11/5.
//

#import "ViewController.h"
#import "GestureView.h"
#import "HDTableView.h"

#define RGB(A, B, C) [UIColor colorWithRed:A/255.0 green:B/255.0 blue:C/255.0 alpha:1.0]

#define HDRandomColor RGB(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) HDTableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
        
    [self test2];
    
    [self test1];
    
    
    /// tableView 的 headerView上面的试图 会拦截 touchBegin
}

- (void)test1 {
    GestureView *gesView = [[GestureView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    gesView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:gesView];
}

- (void)test2 {
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HDNewMeTableViewCell" forIndexPath:indexPath];
    cell.backgroundColor = HDRandomColor;
    return cell;
}


- (HDTableView *)tableView {
    if (!_tableView) {
        _tableView = [[HDTableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.sectionHeaderHeight = 0;
        _tableView.sectionFooterHeight = 0;
        
        
        GestureView *gesView = [[GestureView alloc]initWithFrame:(CGRect){0, 0, self.view.bounds.size.width, 100}];
        gesView.backgroundColor = [UIColor redColor];
        _tableView.tableHeaderView = gesView;
        
        ///< UITableViewStyleGrouped 偏移问题
//        _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, 8, 0);
        _tableView.rowHeight = 100;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"HDNewMeTableViewCell"];
    }
    return _tableView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    NSLog(@"ViewController  touchesBegan");
}
@end
