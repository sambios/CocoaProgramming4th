//
//  main.m
//  lottery
//
//  Created by hsyuan on 2018/8/4.
//  Copyright © 2018年 hsyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LotteryEntry.h"

//3.1
//int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        // 3.1
//        NSMutableArray *array;
//        array = [[NSMutableArray alloc]init];
//        int i;
//
//        for (int i = 0; i< 10; i++) {
//            NSNumber *newNumber = [[NSNumber alloc]initWithInt:(i*3)];
//            [array addObject:newNumber];
//        }
//
//        for (i = 0; i < 10; ++i) {
//            NSNumber *numberToPrint = [array objectAtIndex:i];
//            NSLog(@"The number at index: %d is %@", i, numberToPrint);
//        }
//    }
//    return 0;
//}

//3.3
int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        NSDate *now = [[NSDate alloc]init];
        NSCalendar *cal = [NSCalendar currentCalendar];
        NSDateComponents *weekComponents = [[NSDateComponents alloc]init];
        
        srandom((unsigned)time(0));
        NSMutableArray *array;
        array = [[NSMutableArray alloc]init];
        
        int i;
        for (i = 0;i < 10; i++) {
            [weekComponents setWeekOfYear:i];
            NSDate *iWeeksFromNow;
            
            iWeeksFromNow = [cal dateByAddingComponents:weekComponents toDate:now options:0];
            LotteryEntry *newEntry = [[LotteryEntry alloc]init];
            //[newEntry prepareRandomNumbers];
            [newEntry setEntryDate:iWeeksFromNow];
            
            [array addObject:newEntry];
        }
        
        for (LotteryEntry *entryToPrint in array){
            NSLog(@"%@", entryToPrint);
        }
    }
    return 0;
}
