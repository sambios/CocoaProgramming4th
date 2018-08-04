//
//  LotteryEntry.h
//  lottery
//
//  Created by hsyuan on 2018/8/4.
//  Copyright © 2018年 hsyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LotteryEntry : NSObject {
    NSDate *entryDate;
    int firstNumber;
    int secondNumber;
}

- (id) initWithEntryDate:(NSDate*)theDate;

- (void) prepareRandomNumbers;
- (void) setEntryDate:(NSDate*)date;
- (NSDate*) entryDate;
- (int) firstNumber;
- (int) secondNumber;

@end
