//
//  ViewController3.m
//  IndependencyNavaigationBar
//
//  Created by Lifee on 2020/12/12.
//

#import "ViewController3.h"

@interface ViewController3 ()<UINavigationBarDelegate>

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];

    UINavigationBar * bar = [[UINavigationBar alloc]init];
    bar.barTintColor = [UIColor yellowColor];
    bar.translucent = NO ;
    bar.delegate = self ;
    
    UILabel * lb = [[UILabel alloc]init];
    lb.text = @"ViewController3"  ;
        
    UINavigationItem* left = [[UINavigationItem alloc]init];
    left.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:0 target:self action:@selector(backClick)];
    
    bar.items = @[left];
    bar.topItem.title = @"ViewController3";
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
@end
