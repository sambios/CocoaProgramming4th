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
@property (weak) IBOutlet NSButtonCell *speakButton;
@property (weak) IBOutlet NSButton *stopButton;
@property (weak) IBOutlet NSTableView *tableView;

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
        
        [_speechSynth setDelegate:self];
        
        _voices = [NSSpeechSynthesizer availableVoices];
    }
    
    return self;
}

- (void) awakeFromNib
{
    NSString *defaultVoice = [NSSpeechSynthesizer defaultVoice];
    NSInteger defaultRow = [_voices indexOfObject:defaultVoice];
    NSIndexSet *indices = [NSIndexSet indexSetWithIndex:defaultRow];
    [_tableView selectRowIndexes:indices byExtendingSelection:NO];
    [_tableView scrollRowToVisible:defaultRow];
}


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (BOOL) respondsToSelector:(SEL)aSelector
{
    NSString *methodName = NSStringFromSelector(aSelector);
    NSLog(@" respondsToSelector:%@", methodName);
    return [super respondsToSelector:aSelector];
}

- (IBAction)speak:(id)sender {
    NSString *string = [_textField stringValue];
    if ([string length] == 0) {
        NSLog(@"string from %@ is of zero-length", _textField);
        return;
    }
    
    [_speechSynth startSpeakingString:string];
    NSLog(@"Have started to say:%@", string);
    
    [_stopButton setEnabled:YES];
    [_speakButton setEnabled:NO];
    [_tableView setEnabled:NO];
    
}

- (IBAction)stopit:(id)sender {
    NSLog(@"stopping");
    [_speechSynth stopSpeaking];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

//
// NSSpeechSynthesizeDelegate
// @begin

- (void) speechSynthesizer:(NSSpeechSynthesizer *)sender didFinishSpeaking:(BOOL)finishedSpeaking;
{
    NSLog(@"finishedSpeaking = %d", finishedSpeaking);
    [_stopButton setEnabled:NO];
    [_speakButton setEnabled:YES];
    [_tableView setEnabled:YES];
}

// @end
// NSSpeechSynthesizeDelegate
//

//
// TableView Delegate
//

- (NSInteger) numberOfRowsInTableView:(NSTableView*) tableView
{
    return (NSInteger)[_voices count];
}

- (id) tableView:(NSTableView *)tv objectValueForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSString *v = [_voices objectAtIndex:row];
    NSDictionary *dict = [NSSpeechSynthesizer attributesForVoice:v];
    return [dict objectForKey:NSVoiceName];
}

- (void) tableViewSelectionDidChange:(NSNotification*)notification
{
    NSInteger row = [_tableView selectedRow];
    if (row == -1) {
        return;
    }
    
    NSString *selectedVoice = [_voices objectAtIndex:row];
    [_speechSynth setVoice:selectedVoice];
    NSLog(@"new voice = %@", selectedVoice);
}


@end
