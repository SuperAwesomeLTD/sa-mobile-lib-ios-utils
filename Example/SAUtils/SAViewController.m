//
//  SAViewController.m
//  SAUtils
//
//  Created by Gabriel Coman on 03/08/2016.
//  Copyright (c) 2016 Gabriel Coman. All rights reserved.
//

#import "SAViewController.h"
#import "SAUtils.h"
#import "SAExtensions.h"
#import "SAFileDownloader.h"

@interface SAViewController ()
@end

@implementation SAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    __block NSString *url = @"https://ads.superawesome.tv/v2/ad/28000?test=true";
    [SAUtils sendGETtoEndpoint:url withQueryDict:nil andSuccess:^(NSData *data) {
        NSString *response = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@", response);
    } orFailure:^{
        NSLog(@"Error loading %@", url);
    }];
    
    [[SAFileDownloader getInstance] downloadFileFrom:@"https://s-static.innovid.com/assets/26156/32233/encoded/media-2.mp4"
                                                  to:[[SAFileDownloader getInstance] getDiskLocation]
                                         withSuccess:^{
        
    } orFailure:^{
        
    }];
    
    [[SAFileDownloader getInstance] downloadFileFrom:@"https://ads.staging.superawesome.tv/v2/demo_images/video.mp4"
                                                  to:[[SAFileDownloader getInstance] getDiskLocation]
                                         withSuccess:^{
                                             
                                         } orFailure:^{
                                             
                                         }];
    
//    SAFileObject *f1 = [[SAFileObject alloc] init];
//    f1.url = @"https://s-static.innovid.com/assets/26156/32233/encoded/media-2.mp4";
//    f1.location = [[SAFileDownloader getInstance] getDiskLocation];
//    SAFileObject *f2 = [[SAFileObject alloc] init];
//    f2.url = @"https://ads.staging.superawesome.tv/v2/demo_images/video.mp4";
//    f2.location = [[SAFileDownloader getInstance] getDiskLocation];
//    
//    [[SAFileDownloader getInstance] downloadFileArray:@[f1, f2] startingFrom:0 withSuccess:^{
//        NSLog(@"Finished downloading files!");
//    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
