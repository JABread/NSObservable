//
//  TextField.h
//  NSObservable
//
//  Created by Jon on 2018/8/29.
//  Copyright © 2018年 Jon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObservable.h"

@interface TextField : UITextField

@property(nonatomic, strong)NSObservable<NSString *>* ob_text;

@end
