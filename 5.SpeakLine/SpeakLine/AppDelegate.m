//
//  AppDelegate.m
//  SpeakLine
//
//  Created by hsyuan on 2018/8/4.
//  Copyright © 2018年 hsyuan. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *textField;
@end

@implementation AppDelegate

@synthesize window = _window;
@synthesize textField = _textField;

- (id)init
{
    self = [super init];
    if (self) {
        NSLog(@"Init");
        
        _speechSynth = [[NSSpeechSynthesizer alloc]initWithVoice:nil];
    }
    
    return self;
}



- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (IBAction)speak:(id)sender {
    NSString *string = [_textField stringValue];
    if ([string length] == 0) {
        NSLog(@"string from %@ is of zero-length", _textField);
        return;
    }
    
    [_speechSynth startSpeakingString:string];
    NSLog(@"Have started to say:%@", string);
}

- (IBAction)stopit:(id)sender {
    NSLog(@"stopping");
    [_speechSynth stopSpeaking];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
