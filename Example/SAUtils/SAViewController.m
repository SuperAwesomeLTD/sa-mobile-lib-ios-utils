//
//  SAViewController.m
//  SAUtils
//
//  Created by Gabriel Coman on 03/08/2016.
//  Copyright (c) 2016 Gabriel Coman. All rights reserved.
//

#import "SAViewController.h"
#import "SAImageUtils.h"

@interface SAViewController ()
@end

@implementation SAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIImageView *imgv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 250, 80)];
    imgv.image = [SAImageUtils padlockImage2];
    [self.view addSubview:imgv];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
