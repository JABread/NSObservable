//
//  TextField.m
//  NSObservable
//
//  Created by Jon on 2018/8/29.
//  Copyright © 2018年 Jon. All rights reserved.
//

#import "TextField.h"


@implementation TextField

- (instancetype)init {
    self = [super init];
    if (self) {
        _ob_text = [[NSObservable alloc] initWithValue:@""];
        [self addTarget:self action:@selector(textValueDidChanged:) forControlEvents:(UIControlEventEditingChanged)];
    }
    return self;
}

- (void)textValueDidChanged:(UITextField *)textField {
    self.ob_text.value = textField.text;
}



@end






