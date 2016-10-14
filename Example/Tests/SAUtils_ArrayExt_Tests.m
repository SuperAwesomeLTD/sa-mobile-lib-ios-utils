//
//  SAUtils_ArrayExt_Tests.m
//  SAUtils
//
//  Created by Gabriel Coman on 14/10/2016.
//  Copyright © 2016 Gabriel Coman. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SAExtensions.h"

@interface TestClass : NSObject
@property (nonatomic, assign) BOOL isOK;
@property (nonatomic, strong) NSString *name;
- (id) initWithName:(NSString*)name andIsOK:(BOOL)isOK;
@end

@implementation TestClass

- (id) initWithName:(NSString *)name andIsOK:(BOOL)isOK {
    if (self = [super init]) {
        _name = name;
        _isOK = isOK;
    }
    return self;
}

@end

@interface SAUtils_ArrayExt_Tests : XCTestCase
@property (nonatomic, strong) TestClass *t1;
@property (nonatomic, strong) TestClass *t2;
@property (nonatomic, strong) TestClass *t3;
@property (nonatomic, strong) NSArray *testArray;
@end

@implementation SAUtils_ArrayExt_Tests

- (void)setUp {
    [super setUp];
    _t1 = [[TestClass alloc] initWithName:@"John" andIsOK:true];
    _t2 = [[TestClass alloc] initWithName:@"Lenny" andIsOK:false];
    _t3 = [[TestClass alloc] initWithName:@"Johannes" andIsOK:false];
    _testArray = @[_t1, _t2, _t3];
}

- (void)tearDown {
    [super tearDown];
}

- (void) testFilterByName {
    // when
    NSArray *expected = @[_t1];
    
    // then
    NSArray *result = [_testArray filterBy:@"name" withValue:@"John"];
    
    XCTAssertEqual(result.count, expected.count);
    for (int i = 0; i < result.count; i++) {
        XCTAssertEqualObjects(result[i], expected[i]);
    }
}

- (void) testFilterByBool {
    // when
    NSArray *expected = @[_t2, _t3];
    
    // then
    NSArray *result = [_testArray filterBy:@"isOK" withBool:false];
    
    XCTAssertEqual(result.count, expected.count);
    for (int i = 0; i < result.count; i++) {
        XCTAssertEqualObjects(result[i], expected[i]);
    }
}

- (void) testRemoveAllButFirst {
    // when
    NSArray *expected = @[_t1];
    
    // then
    NSArray *result = [_testArray removeAllButFirstElement];
    
    XCTAssertEqual(result.count, expected.count);
    XCTAssertEqual(result.count, 1);
    for (int i = 0; i < result.count; i++) {
        XCTAssertEqualObjects(result[i], expected[i]);
    }
}

@end
