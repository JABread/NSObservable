//
//  Slider.h
//  NSObservable
//
//  Created by Jon on 2018/8/28.
//  Copyright © 2018年 Jon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObservable.h"

@interface Slider : UISlider

@property(nonatomic, strong)NSObservable<NSNumber *>* ob_position;

@end
