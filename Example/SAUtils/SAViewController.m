//
//  SAViewController.m
//  SAUtils
//
//  Created by Gabriel Coman on 03/08/2016.
//  Copyright (c) 2016 Gabriel Coman. All rights reserved.
//

#import "SAViewController.h"

@interface SAViewController ()
@end

@implementation SAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIImage *image = [UIImage imageNamed:@"background"];
    NSString *str = [UIImagePNGRepresentation(image) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    NSLog(@"%@", str);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
