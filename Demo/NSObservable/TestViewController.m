//
//  JAViewController.m
//  NSObservable
//
//  Created by Jon on 2018/8/29.
//  Copyright © 2018年 Jon. All rights reserved.
//

#import "TestViewController.h"
#import "Slider.h"
#import "TextField.h"

@interface TestViewController ()

@property(nonatomic, strong)Slider *slider;
@property(nonatomic, strong)TextField *textField;

@property(nonatomic, strong)DisposeBag disposeBag;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Slider *slider = [[Slider alloc] init];
    slider.frame = CGRectMake(100, 80, 200, 100);
    [self.view addSubview:slider];
    self.slider = slider;

    TextField *textField = [[TextField alloc] init];
    textField.frame = CGRectMake(100, 200, 200, 40);
    textField.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:textField];
    self.textField = textField;
    
    self.disposeBag = [[NSMutableArray alloc] init];

    __weak __typeof(self) weakSelf = self;
    [[self.slider.ob_position observe:^(NSNumber *value) {
        __strong __typeof(self) strongSelf = weakSelf;
        NSLog(@"%f", [value doubleValue]);
        
        if ([value integerValue] == 1) {
            [strongSelf.slider.ob_position removeObservers];
        }
    }] addDisposableTo:self.disposeBag];

    
    [[self.textField.ob_text observe:^(NSString *text) {
        NSLog(@"ob1: %@", text);
    }] addDisposableTo:self.disposeBag];
    
    [[self.textField.ob_text observe:^(NSString *text) {
        NSLog(@"ob2: %@", text);
    }] addDisposableTo:self.disposeBag];
}

- (void)dealloc {
    NSLog(@"vc dealloc");
}

@end
