//
//  NSObject+DeallocBlock.h
//  XBThemeMaster
//
//  Created by chenxingbin on 2018/5/9.
//  Copyright © 2018年 chenxingbin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (DeallocBlock)


-(id)addDeallocBlock:(void (^)(void))deallocBlock;

@end
