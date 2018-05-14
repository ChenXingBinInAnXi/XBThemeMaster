//
//  XBDeallocBlockExecutor.h
//  XBThemeMaster
//
//  Created by chenxingbin on 2018/5/9.
//  Copyright © 2018年 chenxingbin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XBDeallocBlockExecutor : NSObject

+(instancetype)executorWithDeallocBlock:(void (^)(void))deallocBlock;

@property (nonatomic,copy) void (^deallocBlock)(void);

@end
