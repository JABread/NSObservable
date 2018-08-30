//
//  NSDisposable.m
//  NSObservable
//
//  Created by Jon on 2018/8/29.
//  Copyright © 2018年 Jon. All rights reserved.
//

#import "NSDisposable.h"


@interface NSDisposable()

@property(nonatomic, copy)Dispose dispose;
@property(nonatomic, copy)DisposeBag disposeBag;

@end

@implementation NSDisposable

- (instancetype)init {
    if (self = [super init]) {
        _disposeBag = [[NSMutableArray alloc] initWithCapacity:1];
    }
    return self;
}

- (instancetype)initWithDispose:(Dispose)dispose {
    if (self = [super init]) {
        _dispose = dispose;
    }
    return self;
}

- (void)addDisposableTo:(inout NSMutableArray<NSDisposable *> *)disposeBag {
    [disposeBag addObject:self];
}

- (void)dealloc {
    self.dispose();
}



@end
