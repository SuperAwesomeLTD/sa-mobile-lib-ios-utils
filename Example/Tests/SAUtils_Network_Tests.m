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
}

- (void)tearDown {
    [super tearDown];
}

- (void) testUserAgent {
    // can't test more than making sure the user agent is never nil, atm
    NSString *result = [SAUtils getUserAgent];
    XCTAssertNotNil(result);
}

- (void) testCachebuster {
    // given
    NSInteger bound = 10;
    NSMutableArray *uniqueIntegers = [@[] mutableCopy];
    for (int i = 0; i < bound; i++) {
        [uniqueIntegers addObject:@([SAUtils getCachebuster])];
    }
    
    // when
    BOOL allUniques = true;
    for (int i = 0; i < bound; i++) {
        BOOL hasFound = false;
        
        for (int j = 0; j < bound && j != i; j++) {
            NSInteger nr1 = [[uniqueIntegers objectAtIndex:i] integerValue];
            NSInteger nr2 = [[uniqueIntegers objectAtIndex:j] integerValue];
            if (nr1 == nr2) {
                hasFound = true;
                break;
            }
        }
        
        if (hasFound) {
            break;
            allUniques = false;
        }
    }
    
    // then
    XCTAssertTrue(allUniques);
}

- (void) testFormGetQueryFromDict {
    // given
    NSDictionary *dict = @{
                            @"client_id": @"client-111",
                            @"user_id": @(321)
                            };
    // when
    NSString *expected = @"client_id=client-111&user_id=321";
    
    // then
    NSString *result = [SAUtils formGetQueryFromDict:dict];
    
    // test
    XCTAssertEqualObjects(result, expected);
    
}

- (void) testEncodeUri {
    // @Todo
    
}

- (void) testEncodeJSONDictionaryFromNSDictionary {
    
    // given
    NSDictionary *dict = @{
                           @"client_id": @"client-111",
                           @"user_id": @(321)
                           };
    NSDictionary *dict2 = nil;
    
    // when
    NSString *expected = @"%7B%22client_id%22%3A%22client-111%22%2C%22user_id%22%3A321%7D";
    NSString *expected2 = @"";
    
    // then
    NSString *result = [SAUtils encodeJSONDictionaryFromNSDictionary:dict];
    NSString *result2 = [SAUtils encodeJSONDictionaryFromNSDictionary:dict2];
    
    // test
    XCTAssertEqualObjects(result, expected);
    XCTAssertEqualObjects(result2, expected2);
    
}

- (void) testIsValidUrl {
    // given
    NSString *given1 = @"https://s3-eu-west-1.amazonaws.com/sb-ads-video-transcoded/x7XkGy43vim5P1OpldlOUuxk2cuKsDSn.mp4";
    NSString *given2 = @"";
    NSString *given3 = nil;
    NSString *given4 = @"jkskjasa";
    NSString *given5 = @"https://google.com";
    
    // when
    
    // then
    BOOL result1 = [SAUtils isValidURL:given1];
    BOOL result2 = [SAUtils isValidURL:given2];
    BOOL result3 = [SAUtils isValidURL:given3];
    BOOL result4 = [SAUtils isValidURL:given4];
    BOOL result5 = [SAUtils isValidURL:given5];
    
    // test
    XCTAssertEqual(result1, true);
    XCTAssertEqual(result2, false);
    XCTAssertEqual(result3, false);
    XCTAssertEqual(result4, false);
    XCTAssertEqual(result5, true);
}

- (void) testIsValidEmail {
    // given
    NSString *given1 = @"dev.gabriel.coman@gmail.com";
    NSString *given2 = @"jsksls////";
    NSString *given3 = nil;
    NSString *given4 = @"";
    NSString *given5 = @"test@test.com";
    
    // then
    
    // test
    BOOL result1 = [SAUtils isEmailValid:given1];
    BOOL result2 = [SAUtils isEmailValid:given2];
    BOOL result3 = [SAUtils isEmailValid:given3];
    BOOL result4 = [SAUtils isEmailValid:given4];
    BOOL result5 = [SAUtils isEmailValid:given5];
    
    // test
    XCTAssertEqual(result1, true);
    XCTAssertEqual(result2, false);
    XCTAssertEqual(result3, false);
    XCTAssertEqual(result4, false);
    XCTAssertEqual(result5, true);
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

- (void) testDecodeHTMLEntitiesFrom {
    
}

@end
