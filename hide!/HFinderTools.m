//
//  HFinderTools.m
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

#import "HFinderTools.h"


@interface HFinderTools ()
-(BOOL)readShowAllFiles;
@end



@implementation HFinderTools


#pragma mark - Features

-(BOOL)toggleAllFiles
{
    if ([self readShowAllFiles]) [self hideAllFiles];
                            else [self showAllFiles];
    
    return [self readShowAllFiles];    
}

-(BOOL)showAllFiles
{
    //Set value, relaunch finder.
    [self runSystemCommand:@"defaults write com.apple.finder AppleShowAllFiles YES"];
    [self runSystemCommand:@"killall Finder"];
    return [self readShowAllFiles];
}

-(BOOL)hideAllFiles
{
    //Set value, relaunch finder.
    [self runSystemCommand:@"defaults write com.apple.finder AppleShowAllFiles NO"];
    [self runSystemCommand:@"killall Finder"];
    return [self readShowAllFiles];
}

-(BOOL)readShowAllFiles
{
    NSString *value = [self runSystemCommand:@"defaults read com.apple.finder AppleShowAllFiles"];
    return value.boolValue;
}


#pragma mark - Shell access

-(NSString*)runSystemCommand:(NSString*) command
{
    NSTask *task = [NSTask new];
    [task setLaunchPath:@"/bin/sh"];
    [task setArguments:[NSArray arrayWithObjects:@"-c", command, nil]];
    
    NSPipe *pipe = [NSPipe pipe];
    [task setStandardOutput:pipe];
    
    [task launch];
    
    NSData *data = [[pipe fileHandleForReading] readDataToEndOfFile];
    
    [task waitUntilExit];
    
    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return result;
}


@end
