//
//  SAViewController.m
//  SAUtils
//
//  Created by Gabriel Coman on 03/08/2016.
//  Copyright (c) 2016 Gabriel Coman. All rights reserved.
//

#import "SAViewController.h"
#import "SAUtils.h"
#import "SAActivityView.h"
#import "SAPopup.h"
#import "SAExtensions.h"

@interface SAViewController ()
@end

@implementation SAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"Connectivity: %d", [SAUtils getNetworkConnectivity]);
    
    NSArray *emails = @[@"test@mail.com", @"klskla", @"test@chimp.test.com", @"testy@rox.   "];
    for (NSString *email in emails) {
        NSLog(@"Email %@ is %d", email, [SAUtils isEmailValid:email]);
    }
    
    NSArray *urls = @[@"https://superawesome.tv", @"jksajk", @"http:/john.doe", @"https://   test.com"];
    for (NSString *url in urls) {
        NSLog(@"Url %@ is %d", url, [SAUtils isValidURL:url]);
    }
    
    NSLog(@"User agent is %@", [SAUtils getUserAgent]);
    NSLog(@"System size is %d", [SAUtils getSystemSize]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)showActivityAction:(id)sender {
    [[SAActivityView sharedManager] showActivityView];
}

- (IBAction)showPopupAction:(id)sender {
    [[SAPopup sharedManager] showWithTitle:@"Phone Number"
                                andMessage:@"Please!"
                                andOKTitle:@"Submit"
                               andNOKTitle:nil
                              andTextField:true
                           andKeyboardTyle:UIKeyboardTypePhonePad
                                andPressed:^(int button, NSString *popupMessage) {
        
    }];
}

@end
