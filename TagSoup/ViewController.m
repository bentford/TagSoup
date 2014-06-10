//
//  ViewController.m
//  TagSoup
//
//  Created by Ben Ford on 6/10/14.
//  Copyright (c) 2014 Instrument Marketing, Inc. All rights reserved.
//

#import "ViewController.h"
#import <DTCoreText/DTCoreText.h>
#import "EasyLayout.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
	
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:scrollView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:self.view.bounds];
    label.attributedText = [self stringFromTestInput];
    
    [EasyLayout sizeLabel:label mode:ELLineModeMulti maxWidth:self.view.extWidth];
    [scrollView addSubview:label];
    
    scrollView.contentSize = label.extSize;
    

}

- (NSAttributedString *)stringFromTestInput
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"TestInput" ofType:@"html"];
    NSString *htmlString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    NSData *data = [htmlString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *parseOptions = @{DTUseiOS6Attributes:@(YES),
                                   DTDefaultFontFamily:@"Avenir",
                                   DTDefaultFontName:@"Avenir-Light",
                                   DTDefaultFontSize:@(16.0f)};
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithHTMLData:data options:parseOptions
                                                               documentAttributes:nil];
    
    return attrString;
}


@end
