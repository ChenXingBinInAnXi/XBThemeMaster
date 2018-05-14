//
//  NSObject+DeallocBlock.m
//  XBThemeMaster
//
//  Created by chenxingbin on 2018/5/9.
//  Copyright © 2018年 chenxingbin. All rights reserved.
//

#import "NSObject+DeallocBlock.h"
#import <objc/runtime.h>
#import "XBDeallocBlockExecutor.h"

@implementation NSObject (DeallocBlock)

static void *XBObject_DeallocBlockArray;
-(id)addDeallocBlock:(void (^)(void))deallocBlock{
    

    if (deallocBlock == nil) return nil;
    
    NSMutableArray *deallocBlockArray = objc_getAssociatedObject(self, &XBObject_DeallocBlockArray);
    if (deallocBlockArray == nil) {
        deallocBlockArray = [NSMutableArray array];
        objc_setAssociatedObject(self, &XBObject_DeallocBlockArray, deallocBlockArray, OBJC_ASSOCIATION_RETAIN);
    }
    
    for (XBDeallocBlockExecutor *executor in deallocBlockArray) {
        if (executor.deallocBlock == deallocBlock) {
            return nil;
        }
    }
    
    XBDeallocBlockExecutor *executor = [XBDeallocBlockExecutor executorWithDeallocBlock:deallocBlock];
    [deallocBlockArray addObject:executor];
    return executor;
}

@end
