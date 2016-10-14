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
#import "TestClass.h"
#import "SAImageUtils.h"

@interface SAViewController ()
@end

@implementation SAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    NSLog(@"Connectivity: %d", [SAUtils getNetworkConnectivity]);
//    
//    NSArray *emails = @[@"test@mail.com", @"klskla", @"test@chimp.test.com", @"testy@rox.   "];
//    for (NSString *email in emails) {
//        NSLog(@"Email %@ is %d", email, [SAUtils isEmailValid:email]);
//    }
//    
//    NSArray *urls = @[@"https://superawesome.tv", @"jksajk", @"http:/john.doe", @"https://   test.com"];
//    for (NSString *url in urls) {
//        NSLog(@"Url %@ is %d", url, [SAUtils isValidURL:url]);
//    }
//    
//    NSLog(@"User agent is %@", [SAUtils getUserAgent]);
//    NSLog(@"System size is %d", [SAUtils getSystemSize]);
//    
//    NSLog(@"%@ - %@", NSClassFromString(@"TestClass"), NSClassFromString(@"ABC"));
//    
//    TestClass *tc = [[TestClass alloc] init];
//    
//    [SAUtils invoke:@"method1" onTarget:tc];
//    
//    NSValue *return1 = [SAUtils invoke:@"method2" onTarget:tc];
//    NSString *return1a;
//    [return1 getValue:&return1a];
//    NSLog(@"Return value is %@", return1a);
//    
//    NSValue *return2 = [SAUtils invoke:@"method3" onClass:@"TestClass"];
//    NSInteger return2a;
//    [return2 getValue:&return2a];
//    NSLog(@"Return value is %ld", (long)return2a);
//    
//    [SAUtils invoke:@"method4:" onClass:@"TestClass", @"Wultur"];
//    
//    [SAUtils invoke:@"method5:" onClass:@"TestClass", [NSValue valueWithCGRect:CGRectMake(0, 50, 100, 200)]];
//    
//    [SAUtils invoke:@"nonmethod" onClass:@"TestClass"];
//    [SAUtils invoke:@"nonmethod" onClass:@"ABC"];
//    [SAUtils invoke:@"method4" onClass:@"ABC"];
//
//    [self funcWithParam:[NSValue valueWithCGRect:CGRectMake(0,  5, 2, 3)]];
    
//    self.view.backgroundColor = [UIColor blueColor];
//    
//    UIImageView *imgv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    [imgv setImage:[SAImageUtils gameWallBackground]];
//    [self.view addSubview:imgv];
    
}

- (void) funcWithParam:(id) param {
//    NSLog(@"Param %@", param);
//    CGRect rparam = CGRectZero;
//    NSValue *val = (NSValue*)param;
//    [val getValue:&rparam];
//    NSLog(@"%@", NSStringFromCGRect(rparam));
//    void* rppp;
//    [val getValue:&rppp];
//    NSLog(@"%@", rppp);
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
