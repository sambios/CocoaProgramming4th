//
//  Person.h
//  8.RaiseMan
//
//  Created by hsyuan on 2018/8/4.
//  Copyright © 2018年 hsyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString *personName;
    float expectedRaise;
}

@property (readwrite, copy) NSString* personName;
@property (readwrite) float expectedRaise;
@end
