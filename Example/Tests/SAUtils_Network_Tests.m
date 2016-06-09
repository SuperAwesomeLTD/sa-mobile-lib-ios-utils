//
//  SAUtils_Network_Tests.m
//  SAUtils
//
//  Created by Gabriel Coman on 09/06/2016.
//  Copyright © 2016 Gabriel Coman. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SAUtils.h"

@interface SAUtils_Network_Tests : XCTestCase

@end

@implementation SAUtils_Network_Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void) testBaseURLFromResourceURL {
    // given
    NSString *given1 = @"https://s3-eu-west-1.amazonaws.com/sb-ads-video-transcoded/x7XkGy43vim5P1OpldlOUuxk2cuKsDSn.mp4";
    NSString *given2 = @"https://s3-eu-west-1.amazonaws.com/sb-ads-uploads/images/cvWABPEIS7vUEtlv5U17MwaTNhRARYjB.png";
    NSString *given3 = @"https://s3-eu-west-1.amazonaws.com/sb-ads-uploads/rich-media/tNmFLJ7kGQWBbyORkIqTJ4oqykaGPU9w/rich-media/index.html";
    NSString *given4 = nil;
    NSString *given5 = @"https:/klsa9922:skllsa/2100921091/saas///";
    
    // when
    NSString *expected1 = @"https://s3-eu-west-1.amazonaws.com/sb-ads-video-transcoded/";
    NSString *expected2 = @"https://s3-eu-west-1.amazonaws.com/sb-ads-uploads/images/";
    NSString *expected3 = @"https://s3-eu-west-1.amazonaws.com/sb-ads-uploads/rich-media/tNmFLJ7kGQWBbyORkIqTJ4oqykaGPU9w/rich-media/";
    NSString *expected4 = nil;
    NSString *expected5 = nil;
    
    // then
    NSString *result1 = [SAUtils findBaseURLFromResourceURL:given1];
    NSString *result2 = [SAUtils findBaseURLFromResourceURL:given2];
    NSString *result3 = [SAUtils findBaseURLFromResourceURL:given3];
    NSString *result4 = [SAUtils findBaseURLFromResourceURL:given4];
    NSString *result5 = [SAUtils findBaseURLFromResourceURL:given5];
    
    XCTAssertTrue([result1 isEqualToString:expected1]);
    XCTAssertTrue([result2 isEqualToString:expected2]);
    XCTAssertTrue([result3 isEqualToString:expected3]);
    XCTAssertTrue(result4 == expected4);
    XCTAssertTrue(result5 == expected5);
}

@end
