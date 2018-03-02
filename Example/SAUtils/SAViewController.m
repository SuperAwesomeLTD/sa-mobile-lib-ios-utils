//
//  SAViewController.m
//  SAUtils
//
//  Created by Gabriel Coman on 03/08/2016.
//  Copyright (c) 2016 Gabriel Coman. All rights reserved.
//

#import "SAViewController.h"
#import "SAAlert.h"

@interface SAViewController ()
@end

@implementation SAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [[SAAlert getInstance] showWithTitle:@"My title"
                              andMessage:@"Message"
                              andOKTitle:@"OK"
                             andNOKTitle:nil
                            andTextField:false
                         andKeyboardTyle:UIKeyboardTypeDefault
                              andPressed:^(int button, NSString *popupMessage) {
                                  NSLog(@"Clicked on %d", button);
                              }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
