//
//  HFinderTools.h
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

#import <Foundation/Foundation.h>
#import "HFinderTools.h"
#import "HMenulet.h"


@interface HAppController : NSObject

    <HMenuletDelegate>

@property (nonatomic, weak) IBOutlet NSTextField *textField;
-(IBAction)show:(id) sender;
-(IBAction)hide:(id) sender;
-(IBAction)toggle:(id) sender;
-(IBAction)read:(id) sender;

@end
