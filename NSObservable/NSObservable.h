//
//  NSObservable.h
//  NSObservable
//
//  Created by Jon on 2018/8/28.
//  Copyright © 2018年 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDisposable.h"


@interface NSObservable<T> : NSObject

typedef void(^Observer)(T);

@property(nonatomic, strong)T value;

- (instancetype)initWithValue:(T)value;

- (NSDisposable *)observe:(Observer)observer;
- (void)removeObservers;



@end
