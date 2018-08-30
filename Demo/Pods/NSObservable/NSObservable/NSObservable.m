//
//  NSObservable.m
//  NSObservable
//
//  Created by Jon on 2018/8/28.
//  Copyright © 2018年 Jon. All rights reserved.
//

#import "NSObservable.h"


@interface NSObservable<T>()  {
    T _value;
}

@property(nonatomic, assign)long sequence;
@property(nonatomic, copy)NSMutableDictionary<NSString *, Observer> *observers;

@end


@implementation NSObservable

- (instancetype)init {
    if (self = [super init]) {
        _observers = [[NSMutableDictionary alloc] init];
        _sequence = 0;
        _value = [[NSObject alloc] init];
    }
    return self;
}

- (instancetype)initWithValue:(NSObject *)value {
    if (self = [super init]) {
        _observers = [[NSMutableDictionary alloc] init];
        _sequence = 0;
        _value = value;
    }
    return self;
}

- (void)setValue:(NSObject *)value {
    [self.observers.allValues enumerateObjectsUsingBlock:^(Observer  _Nonnull observer, NSUInteger idx, BOOL * _Nonnull stop) {
        observer(value);
    }];
    _value = value;
}

- (NSDisposable *)observe:(Observer)observer {
    NSString *key = [NSString stringWithFormat:@"%ld", self.sequence++];
    self.observers[key] = observer;
    
    observer(_value);
    
    NSDisposable *disposable = [[NSDisposable alloc] initWithDispose:^{
        self.observers[key] = nil;
    }];
    
    return disposable;
}


- (void)removeObservers {
    [self.observers removeAllObjects];
    self.sequence = 0;
}


@end









