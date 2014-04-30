//
//  HMenulet.m
//  hide!
//
//  Created by Borbás Geri on 5/16/13.
//  Copyright (c) 2010-2014 eppz! development, LLC.
//
//  follow http://www.twitter.com/_eppz
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
#import "HMenulet.h"


@interface HMenulet ()
@property (nonatomic, strong) NSStatusItem *statusItem;
@end


@implementation HMenulet


-(id)init
{
    if (self = [super init])
    {
        //Create.
        self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
        [self.statusItem setHighlightMode:YES];
        [self.statusItem setEnabled:YES];
        
        //Skin.
        self.on = NO;
        
        //Actions.
        [self.statusItem setAction:@selector(clicked:)];
        [self.statusItem setTarget:self];
    }
    return self;
}

-(void)clicked:(id) sender
{
    self.on = !_on; //Toggle.
    [self.delegate menuletClicked:self];
}

-(void)setOn:(BOOL) on
{
    _on = on;
    
    NSString *toolTip = (on) ? @"Hide all files" : @"Show all files";
    NSString *imageName = (on) ? @"on.png" : @"off.png";
    
    self.statusItem.toolTip = toolTip;
    self.statusItem.image = [NSImage imageNamed:imageName];
}


@end
