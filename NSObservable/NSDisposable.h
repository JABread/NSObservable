//
//  NSDisposable.h
//  NSObservable
//
//  Created by Jon on 2018/8/29.
//  Copyright © 2018年 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NSDisposable;

typedef NSMutableArray<NSDisposable *>* DisposeBag;
typedef void(^Dispose)(void);

@interface NSDisposable : NSObject

- (instancetype)initWithDispose:(Dispose)dispose;

- (void)addDisposableTo:(NSMutableArray<NSDisposable *> *)disposeBag;

@end
