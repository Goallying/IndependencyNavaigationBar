//
//  ViewController1.m
//  IndependencyNavaigationBar
//
//  Created by Lifee on 2020/12/11.
//

#import "ViewController1.h"
#import "ViewController2.h"

@interface ViewController1 ()<UINavigationBarDelegate>

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton * b = [[UIButton alloc]initWithFrame:CGRectMake(10, 100, 88, 44)];
    b.backgroundColor = [UIColor redColor];
    [b addTarget:self action:@selector(oneClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:b];
    
    
    UINavigationBar * bar = [[UINavigationBar alloc]init];
    bar.translucent = NO ;
    bar.delegate = self ;
        
    UINavigationItem* left = [[UINavigationItem alloc]init];
    left.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:0 target:self action:@selector(backClick)];
    
    UIBarButtonItem * i1 = [[UIBarButtonItem alloc]initWithTitle:@"RIGHT1" style:0 target:self action:@selector(backClick)];
    UIBarButtonItem * i2 = [[UIBarButtonItem alloc]initWithTitle:@"RIGHT2" style:0 target:self action:@selector(backClick)];

    left.rightBarButtonItems = @[i1,i2];
    
    bar.items = @[left];
    bar.topItem.title = @"ViewController1";
//    bar.backItem.title = @"返回返回";
    [self.view addSubview:bar];
    
    bar.translatesAutoresizingMaskIntoConstraints = NO ;
    [bar.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [bar.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;

    if (@available(iOS 11 , *)) {
        [bar.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor].active = YES;

    }else {
        [bar.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES ;

    }
    
}
- (void)backClick {
    [self.navigationController popViewControllerAnimated:YES];
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
- (void)oneClick {
    ViewController2 * vc = [[ViewController2 alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
