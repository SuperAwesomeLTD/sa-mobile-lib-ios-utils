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
@property (nonatomic, assign) NSInteger pay;
- (id) initWithName:(NSString*)name andIsOK:(BOOL)isOK andPay:(NSInteger)pay;
@end

@implementation TestClass

- (id) initWithName:(NSString *)name andIsOK:(BOOL)isOK andPay:(NSInteger)pay{
    if (self = [super init]) {
        _name = name;
        _isOK = isOK;
        _pay = pay;
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
    _t1 = [[TestClass alloc] initWithName:@"John" andIsOK:true andPay:0];
    _t2 = [[TestClass alloc] initWithName:@"Lenny" andIsOK:false andPay:32000];
    _t3 = [[TestClass alloc] initWithName:@"Johannes" andIsOK:false andPay:18000];
    _testArray = @[_t1, _t2, _t3];
}

- (void)tearDown {
    [super tearDown];
}

- (void) testFilterByName1 {
    // when
    NSArray *expected = @[_t1];
    
    // then
    NSArray *result = [_testArray filterBy:@"name" withValue:@"John"];
    
    XCTAssertEqual(result.count, expected.count);
    for (int i = 0; i < result.count; i++) {
        XCTAssertEqualObjects(result[i], expected[i]);
    }
}

- (void) testFilterByName2 {
    // given
    NSArray *given = nil;
    
    // when
    NSArray *expected = nil;
    
    // then
    NSArray *result = [given filterBy:@"name" withValue:@"John"];
    
    XCTAssertNil(result);
    XCTAssertEqualObjects(result, expected);
}

- (void) testFilterByName3 {
    // when
    NSArray *expected = @[];
    
    // then
    NSArray *result = [_testArray filterBy:@"NonExistentField" withValue:@"Johannes"];
    
    XCTAssertEqual(result.count, 0);
    XCTAssertEqualObjects(result, expected);
}

- (void) testFilterByName4 {
    // when
    NSArray *expected = @[];
    
    // then
    NSArray *result = [_testArray filterBy:@"name" withValue:@"NonExistentName"];
    
    XCTAssertEqual(result.count, 0);
    XCTAssertEqualObjects(result, expected);
}

- (void) testFilterByName5 {
    // when
    NSArray *expected = @[];
    
    // then
    NSArray *result = [_testArray filterBy:@"isOK" withValue:@"John"];
    
    XCTAssertEqual(result.count, 0);
    XCTAssertEqualObjects(result, expected);
    
}

- (void) testFilterByBool1 {
    // when
    NSArray *expected = @[_t2, _t3];
    
    // then
    NSArray *result = [_testArray filterBy:@"isOK" withBool:false];
    
    XCTAssertEqual(result.count, expected.count);
    for (int i = 0; i < result.count; i++) {
        XCTAssertEqualObjects(result[i], expected[i]);
    }
}

- (void) testFilterByBool2 {
    // given
    NSArray *given = nil;
    
    // when
    NSArray *expected = nil;
    
    // then
    NSArray *result = [given filterBy:@"isOK" withBool:false];
    
    XCTAssertNil(result);
    XCTAssertEqualObjects(result, expected);
}

- (void) testFilterByBool3 {
    // when
    NSArray *expected = @[];
    
    // then
    NSArray *result = [_testArray filterBy:@"NonExistentField" withBool:false];
    
    XCTAssertEqual(result.count, 0);
    XCTAssertEqualObjects(result, expected);
}

- (void) testFilterByBool4 {
    // when
    NSArray *expected = @[];
    
    // then
    NSArray *result = [_testArray filterBy:@"name" withBool:false];
    
    XCTAssertEqual(result.count, 0);
    XCTAssertEqualObjects(result, expected);
}

- (void) testFilterByInt1 {
    // when
    NSArray *expected = @[_t2];
    
    // then
    NSArray *result = [_testArray filterBy:@"pay" withInt:32000];
    
    //
    XCTAssertEqual(result.count, expected.count);
    XCTAssertEqualObjects(result, expected);
}

- (void) testFilterByInt2 {
    // given
    NSArray *given = nil;
    
    // when
    NSArray *expected = nil;
    
    // then
    NSArray *result = [given filterBy:@"pay" withInt:18000];
    
    XCTAssertNil(result);
    XCTAssertEqualObjects(result, expected);
}

- (void) testFilterByInt3 {
    // when
    NSArray *expected = @[];
    
    // then
    NSArray *result = [_testArray filterBy:@"NonExistentField" withInt:0];
    
    XCTAssertEqual(result.count, 0);
    XCTAssertEqualObjects(result, expected);
}

- (void) testFilterByInt4 {
    // when
    NSArray *expected = @[];
    
    // then
    NSArray *result = [_testArray filterBy:@"name" withInt:32000];
    
    XCTAssertEqual(result.count, 0);
    XCTAssertEqualObjects(result, expected);
}

- (void) testRemoveAllButFirst1 {
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

- (void) testRemoveAllButFirst2 {
    // given
    NSArray *given = nil;
    
    // when
    NSArray *expected = nil;
    
    // then
    NSArray *result = [given removeAllButFirstElement];
    
    XCTAssertNil(result);
    XCTAssertEqualObjects(result, expected);
}

@end
