//
//  SAUtils_Aux_Tests.m
//  SAUtils
//
//  Created by Gabriel Coman on 09/06/2016.
//  Copyright © 2016 Gabriel Coman. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SAUtils.h"

@interface SAUtils_Aux_Tests : XCTestCase

@end

@implementation SAUtils_Aux_Tests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void) testFrameMapping {
    // given
    CGRect oldframe = CGRectMake(0, 30, 280, 45);
    CGRect newframe = CGRectMake(0, 0, 200, 100);
    
    // when
    CGRect expected = CGRectMake(95, 0, 90, 45);
    
    // then
    CGRect result = [SAUtils mapOldFrame:oldframe toNewFrame:newframe];
    XCTAssert(CGRectEqualToRect(result, expected));
}

- (void) testRectInRect {
    // given
    CGRect child1 = CGRectMake(0, 250, 320, 45);
    CGRect child2 = CGRectMake(-23, 720, 250, 45);
    CGRect screen = CGRectMake(0, 0, 320, 684);
    
    // when
    BOOL expected1 = true;
    BOOL expected2 = false;
    
    // then
    BOOL result1 = [SAUtils isRect:child1 inRect:screen];
    BOOL result2 = [SAUtils isRect:child2 inRect:screen];
    XCTAssertEqual(result1, expected1);
    XCTAssertEqual(result2, expected2);
}

- (void) testRandomNumber {
    // given
    NSInteger lower = 0;
    NSInteger upper = 58;
    
    // when
    BOOL expected1 = true;
    BOOL expected2 = false;
    
    // then
    NSInteger result = [SAUtils randomNumberBetween:lower maxNumber:upper];
    BOOL result1 = result < upper;
    BOOL result2 = result > upper;
    XCTAssertEqual( result1 , expected1);
    XCTAssertEqual( result2 , expected2);
}

- (void) testFindSubstring {
    // given
    NSString *source = @"New test string with a number of words in it";
    NSString *start = @"string";
    NSString *end = @"words";
    
    // when
    NSString *expected = @" with a number of ";
    
    // then
    NSString *result = [SAUtils findSubstringFrom:source betweenStart:start andEnd:end];
    XCTAssertTrue([result isEqualToString:expected]);
}

- (void) testGenerateUniqueKey {
    // given
    NSInteger bound = 100;
    NSMutableArray *uniqueKeys = [@[] mutableCopy];
    for (int i = 0; i < bound; i++) {
        [uniqueKeys addObject:[SAUtils generateUniqueKey]];
    }
    
    // when
    BOOL allUniques = true;
    for (int i = 0; i < bound; i++) {
        BOOL hasFound = false;
        
        for (int j = 0; j < bound && j != i; j++) {
            if ([uniqueKeys[i] isEqualToString:uniqueKeys[j]]) {
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


@end
