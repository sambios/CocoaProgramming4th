//
//  LotteryEntry.m
//  lottery
//
//  Created by hsyuan on 2018/8/4.
//  Copyright © 2018年 hsyuan. All rights reserved.
//

#import "LotteryEntry.h"

@implementation LotteryEntry



- (void) prepareRandomNumbers
{
    firstNumber = ((int)random() % 100) + 1;
    secondNumber = ((int)random() % 100) + 1;
}

- (id) init {
//    self = [super init];
//
//    if (self) {
//        firstNumber = ((int)random() % 100) + 1;
//        secondNumber = ((int)random() % 100) + 1;
//    }
//    return self;
    return [self initWithEntryDate:[NSDate date]];
    
}

- (id) initWithEntryDate:(NSDate *)theDate
{
    self = [super init];
    if (self) {
        entryDate = theDate;
        firstNumber = ((int)random() % 100) + 1;
        secondNumber = ((int)random() % 100) + 1;
    }
    
    return self;
}


- (void) setEntryDate:(NSDate*)date
{
    entryDate = date;
}

- (NSDate*) entryDate
{
    return entryDate;
}


- (int) firstNumber
{
    return firstNumber;
}

- (int) secondNumber
{
    return secondNumber;
}

- (NSString*) description
{
    NSDateFormatter *formater = [[NSDateFormatter alloc]init];
    [formater setTimeStyle:NSDateFormatterNoStyle];
    [formater setDateStyle:NSDateFormatterMediumStyle];
    
    NSString *result;
    result = [[NSString alloc]initWithFormat:@"%@=%d and %d", [formater stringFromDate:entryDate],
              firstNumber, secondNumber];
    return result;
}

@end
