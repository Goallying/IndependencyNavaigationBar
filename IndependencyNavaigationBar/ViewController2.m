//
//  ViewController2.m
//  IndependencyNavaigationBar
//
//  Created by Lifee on 2020/12/11.
//

#import "ViewController2.h"
#import "ViewController3.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton * b = [[UIButton alloc]initWithFrame:CGRectMake(10, 100, 88, 44)];
    b.backgroundColor = [UIColor redColor];
    [b setTitle:@"PUSH" forState:UIControlStateNormal];
    [b addTarget:self action:@selector(oneClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:b];
    
    UIButton * back = [[UIButton alloc]initWithFrame:CGRectMake(10, 200, 88, 44)];
    back.backgroundColor = [UIColor redColor];
    [back setTitle:@"BACK" forState:UIControlStateNormal];
    [back addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:back];
}
- (void)backClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)oneClick {
    ViewController3 * vc = [[ViewController3 alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
