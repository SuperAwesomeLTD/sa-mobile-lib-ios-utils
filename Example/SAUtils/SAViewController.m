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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)showActivityAction:(id)sender {
    [[SAActivityView sharedManager] showActivityView];
}

- (IBAction)showPopupAction:(id)sender {
    SAPopup *popup = [[SAPopup alloc] init];
    [popup showWithTitle:@"Phone Number" andMessage:@"Please!" andOKTitle:@"Submit" andNOKTitle:@"Cancel" andTextField:true andKeyboardTyle:UIKeyboardTypePhonePad andOKBlock:^(NSString *popupMessage) {
        
    } andNOKBlock:^{
        
    }];
}

@end
