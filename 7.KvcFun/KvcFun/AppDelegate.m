//
//  AppDelegate.m
//  KvcFun
//
//  Created by hsyuan on 2018/8/4.
//  Copyright © 2018年 hsyuan. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (readwrite, assign) int fido;

@end


@implementation AppDelegate

//可以省略。
//@synthesize fido=_fido;

- (id) init
{
    self = [super init];
    if (self) {
        [self setValue:[NSNumber numberWithInt:5] forKey:@"fido"];
        NSNumber *n = [self valueForKey:@"fido"];
        NSLog(@"fido=%@", n);
    }
    return self;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


//- (int)fido
//{
//    NSLog(@"-fido is returning %d", fido);
//    return fido;
//}
//
//- (void)setFido:(int)x
//{
//    NSLog(@"-setFido:is called with %d", x);
//    fido = x;
//}

- (IBAction)incrementFido:(id)sender
{
    [self willChangeValueForKey:@"fido"];
    _fido ++;
    NSLog(@" fido is now %d", _fido);
    [self didChangeValueForKey:@"fido"];
}




@end
