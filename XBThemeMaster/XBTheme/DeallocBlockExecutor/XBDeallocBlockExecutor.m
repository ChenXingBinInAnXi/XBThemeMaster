//
//  XBDeallocBlockExecutor.m
//  XBThemeMaster
//
//  Created by chenxingbin on 2018/5/9.
//  Copyright © 2018年 chenxingbin. All rights reserved.
//

#import "XBDeallocBlockExecutor.h"

@implementation XBDeallocBlockExecutor

+(instancetype)executorWithDeallocBlock:(void (^)(void))deallocBlock{
    XBDeallocBlockExecutor *o = [XBDeallocBlockExecutor new];
    o.deallocBlock = deallocBlock;
    return o;
}

-(void)dealloc{

    !self.deallocBlock ? : self.deallocBlock();
}

@end
