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

#import "HAppController.h"


@interface HAppController ()
@property (nonatomic, strong) HFinderTools *finder;
@property (nonatomic, strong) HMenulet *menulet;
@property (nonatomic) BOOL shown;
@end


@implementation HAppController


#pragma mark - Creation

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    //Create.
    self.finder = [HFinderTools new];
    self.menulet = [HMenulet new];
    self.menulet.delegate = self;
    
    //Setup.
    self.shown = [self.finder readShowAllFiles];
}


#pragma mark - Interactions (from debug panel)

-(IBAction)show:(id) sender
{ self.shown = [self.finder showAllFiles]; }

-(IBAction)hide:(id) sender
{ self.shown = [self.finder hideAllFiles]; }

-(IBAction)toggle:(id) sender
{ self.shown = [self.finder toggleAllFiles]; }

-(IBAction)read:(id) sender
{ self.shown = [self.finder readShowAllFiles]; }


#pragma mark - Interactions (from menulet)

-(void)menuletClicked:(HMenulet*) menulet
{ self.shown = [self.finder toggleAllFiles]; }


#pragma mark - UI

-(void)setShown:(BOOL)shown
{
    _shown = shown;
    
    //UI.    
    NSString *value = (shown) ? @"YES \n" : @"NO \n";
    self.textField.stringValue = [self.textField.stringValue stringByAppendingString:value];
    
    //UI (menulet).
    self.menulet.on = shown;
}


@end
