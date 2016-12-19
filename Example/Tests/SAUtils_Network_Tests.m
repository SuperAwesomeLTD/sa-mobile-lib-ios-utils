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
    NSString *userAgent = [SAAux getUserAgent];
    
    XCTAssertNotNil(userAgent);
    
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ) {
        XCTAssertTrue([userAgent rangeOfString:@"iPad"].location > 0);
    } else {
        XCTAssertTrue([userAgent rangeOfString:@"iPhone"].location > 0);
    }
    
}

- (void) testCachebuster {
    // given
    NSInteger bound = 10;
    NSMutableArray *uniqueIntegers = [@[] mutableCopy];
    for (int i = 0; i < bound; i++) {
        [uniqueIntegers addObject:@([SAAux getCachebuster])];
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
    NSDictionary *dict2 = @{};
    NSDictionary *dict3 = nil;
    
    // when
    NSString *expected = @"client_id=client-111&user_id=321";
    NSString *expected2 = @"";
    NSString *expected3 = @"";
    
    // then
    NSString *result = [SAAux formGetQueryFromDict:dict];
    NSString *result2 = [SAAux formGetQueryFromDict:dict2];
    NSString *result3 = [SAAux formGetQueryFromDict:dict3];
    
    // test
    XCTAssertEqualObjects(result, expected);
    XCTAssertEqualObjects(result2, expected2);
    XCTAssertEqualObjects(result3, expected3);
    
}

- (void) testEncodeUri {
    // given
    NSString *given1 = @"https://s3-eu-west-1.amazonaws.com/sb-ads-video-transcoded/x7XkGy43vim5P1OpldlOUuxk2cuKsDSn.mp4";
    NSString *given2 = @"";
    NSString *given3 = nil;
    NSString *given4 = @"https:/klsa9922:skllsa/2100921091/saas///";
    
    // when
    NSString *expected1 = @"https%3A%2F%2Fs3-eu-west-1.amazonaws.com%2Fsb-ads-video-transcoded%2Fx7XkGy43vim5P1OpldlOUuxk2cuKsDSn.mp4";
    NSString *expected2 = @"";
    NSString *expected3 = @"";
    NSString *expected4 = @"https%3A%2Fklsa9922%3Askllsa%2F2100921091%2Fsaas%2F%2F%2F";
    
    // then
    NSString *result1 = [SAAux encodeURI:given1];
    NSString *result2 = [SAAux encodeURI:given2];
    NSString *result3 = [SAAux encodeURI:given3];
    NSString *result4 = [SAAux encodeURI:given4];
    
    XCTAssertEqualObjects(result1, expected1);
    XCTAssertEqualObjects(result2, expected2);
    XCTAssertEqualObjects(result3, expected3);
    XCTAssertEqualObjects(result4, expected4);
}

- (void) testEncodeJSONDictionaryFromNSDictionary {
    
    // given
    NSDictionary *dict = @{
                           @"client_id": @"client-111",
                           @"user_id": @(321)
                           };
    NSDictionary *dict2 = @{};
    NSDictionary *dict3 = nil;
    
    // when
    NSString *expected = @"%7B%22client_id%22%3A%22client-111%22%2C%22user_id%22%3A321%7D";
    NSString *expected2 = @"%7B%7D";
    NSString *expected3 = @"%7B%7D";
    
    // then
    NSString *result = [SAAux encodeJSONDictionaryFromNSDictionary:dict];
    NSString *result2 = [SAAux encodeJSONDictionaryFromNSDictionary:dict2];
    NSString *result3 = [SAAux encodeJSONDictionaryFromNSDictionary:dict3];
    
    // test
    XCTAssertEqualObjects(result, expected);
    XCTAssertEqualObjects(result2, expected2);
    XCTAssertEqualObjects(result3, expected3);
    
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
    BOOL result1 = [SAAux isValidURL:given1];
    BOOL result2 = [SAAux isValidURL:given2];
    BOOL result3 = [SAAux isValidURL:given3];
    BOOL result4 = [SAAux isValidURL:given4];
    BOOL result5 = [SAAux isValidURL:given5];
    
    // test
    XCTAssertTrue(result1);
    XCTAssertFalse(result2);
    XCTAssertFalse(result3);
    XCTAssertFalse(result4);
    XCTAssertTrue(result5);
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
    BOOL result1 = [SAAux isEmailValid:given1];
    BOOL result2 = [SAAux isEmailValid:given2];
    BOOL result3 = [SAAux isEmailValid:given3];
    BOOL result4 = [SAAux isEmailValid:given4];
    BOOL result5 = [SAAux isEmailValid:given5];
    
    // test
    XCTAssertTrue(result1);
    XCTAssertFalse(result2);
    XCTAssertFalse(result3);
    XCTAssertFalse(result4);
    XCTAssertTrue(result5);
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
    NSString *result1 = [SAAux findBaseURLFromResourceURL:given1];
    NSString *result2 = [SAAux findBaseURLFromResourceURL:given2];
    NSString *result3 = [SAAux findBaseURLFromResourceURL:given3];
    NSString *result4 = [SAAux findBaseURLFromResourceURL:given4];
    NSString *result5 = [SAAux findBaseURLFromResourceURL:given5];
    
    XCTAssertTrue([result1 isEqualToString:expected1]);
    XCTAssertTrue([result2 isEqualToString:expected2]);
    XCTAssertTrue([result3 isEqualToString:expected3]);
    XCTAssertTrue(result4 == expected4);
    XCTAssertTrue(result5 == expected5);
}

- (void) testDecodeHTMLEntitiesFrom {
    
}

@end
