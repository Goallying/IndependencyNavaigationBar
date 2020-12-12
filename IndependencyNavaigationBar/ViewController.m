//
//  ViewController.m
//  IndependencyNavaigationBar
//
//  Created by Lifee on 2020/12/11.
//

#import "ViewController.h"
#import "ViewController1.h"

#import <Masonry/Masonry.h>

@interface ViewController ()<UINavigationBarDelegate ,UITableViewDelegate ,UITableViewDataSource>

@property (nonatomic ,strong) UITableView * tableView ;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.hidden = YES ;
    
    UINavigationBar * bar = [[UINavigationBar alloc]init];
    bar.translucent = YES ;
    bar.backgroundColor = [UIColor redColor];


    bar.delegate = self ;
    UINavigationItem * item = [[UINavigationItem alloc]init];
//    UIMenu * menu  ;
    item.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"LEFT" menu:nil];
    item.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"RIGHT" style:0 target:self action:@selector(pushClick:)];
    
    bar.items = @[item];
    bar.topItem.title = @"ORGINAL" ;
    [self.view addSubview:bar];
    
    bar.translatesAutoresizingMaskIntoConstraints = NO ;
    [bar.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [bar.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;

    if (@available(iOS 11 , *)) {
        [bar.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor].active = YES;
    }else {
        [bar.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES ;

    }
    _tableView = [[UITableView alloc]init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.translatesAutoresizingMaskIntoConstraints = NO ;
    [self.view addSubview:_tableView];
    
    [_tableView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES ;
    [_tableView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES ;
    [_tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES ;
    [_tableView.topAnchor constraintEqualToAnchor:bar.bottomAnchor].active = YES;

    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"------%ld",indexPath.row];
    return cell ;
}
- (UIBarPosition)positionForBar:(id<UIBarPositioning>)bar {
    return UIBarPositionTopAttached;
}
- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPushItem:(UINavigationItem *)item {
    return  YES;
}
- (void)navigationBar:(UINavigationBar *)navigationBar didPushItem:(UINavigationItem *)item {
    
}
- (void)navigationBar:(UINavigationBar *)navigationBar didPopItem:(UINavigationItem *)item {
    
}
- (IBAction)pushClick:(UIButton *)sender {
    ViewController1 * vc = [ViewController1 alloc] ;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
