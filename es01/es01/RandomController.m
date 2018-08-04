//
//  RandomController.m
//  es01
//
//  Created by hsyuan on 2018/8/4.
//  Copyright © 2018年 hsyuan. All rights reserved.
//

#import "RandomController.h"
#import <AppKit/AppKit.h>

@implementation RandomController
{
    __weak IBOutlet NSTextField *textField;
}

- (IBAction)seed:(id)sender {
    srandom((unsigned)time(0));
    [textField setStringValue:@"Generator seeded"];
}


- (IBAction)generate:(id)sender {
    int generated;
    generated = (int)(random() % 100) + 1;
    [textField setIntValue:generated];
}

@end
