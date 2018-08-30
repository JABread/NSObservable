//
//  ViewController.m
//  NSObservable
//
//  Created by Jon on 2018/8/28.
//  Copyright © 2018年 Jon. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)popVc:(id)sender {
    TestViewController *vc = [[TestViewController alloc] init];
    vc.view.backgroundColor = [UIColor redColor];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
