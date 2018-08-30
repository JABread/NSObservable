//
//  Slider.m
//  NSObservable
//
//  Created by Jon on 2018/8/28.
//  Copyright © 2018年 Jon. All rights reserved.
//

#import "Slider.h"

@implementation Slider

- (instancetype)init {
    self = [super init];
    if (self) {
        self.minimumValue = 0;
        self.maximumValue = 100;
        self.ob_position = [[NSObservable alloc] initWithValue:[NSNumber numberWithInt:0]];
        [self addTarget:self action:@selector(sliderValueDidChanged:) forControlEvents:(UIControlEventValueChanged)];
    }
    return self;
}

- (void)sliderValueDidChanged:(Slider *)slider {
    self.ob_position.value = [NSNumber numberWithFloat:self.value/self.maximumValue];
    
}

@end
