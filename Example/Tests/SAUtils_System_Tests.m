//
//  SAUtils_System_Tests.m
//  SAUtils
//
//  Created by Gabriel Coman on 09/06/2016.
//  Copyright © 2016 Gabriel Coman. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SAUtils.h"

@interface SAUtils_System_Tests : XCTestCase
@end

@implementation SAUtils_System_Tests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void) testSystemSize {
    // given
    SASystemSize size = [SAUtils getSystemSize];
    
    // then
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ) {
        XCTAssertEqual(size, size_tablet);
    } else {
        XCTAssertEqual(size, size_mobile);
    }
}

- (void) testVerboseSystemDetails {
    // given
    NSString *details = [SAUtils getVerboseSystemDetails];
    
    // then
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ) {
        XCTAssertEqualObjects(details, @"ios_tablet");
    } else {
        XCTAssertEqualObjects(details, @"ios_mobile");
    }
}

- (void) testPathInDocuments {
    // given
    NSArray *documentsPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = documentsPaths.firstObject;
    
    // when
    NSString *path1 = [NSString stringWithFormat:@"%@/%@", documentPath, @"abc.txt"];
    NSString *path2 = [NSString stringWithFormat:@"%@/%@", documentPath, @"tef"];
    NSString *path3 = [NSString stringWithFormat:@"%@", documentPath];
    
    // then
    NSString *tpath1 = [SAUtils filePathInDocuments:@"abc.txt"];
    NSString *tpath2 = [SAUtils filePathInDocuments:@"tef"];
    NSString *tpath3 = [SAUtils filePathInDocuments:nil];
    
    XCTAssertEqualObjects(path1, tpath1);
    XCTAssertEqualObjects(path2, tpath2);
    XCTAssertEqualObjects(path3, tpath3);
}

@end
