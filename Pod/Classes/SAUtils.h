//
//  SAUtils.h
//  Pods
//
//  Created by Gabriel Coman on 09/03/2016.
//
//

#import <Foundation/Foundation.h>

////////////////////////////////////////////////////////////////////////////////
// Different "globally" available declarations; for enums, typedefs, etc
////////////////////////////////////////////////////////////////////////////////

// enum that lists the available system sizes
typedef enum SASystemSize {
    size_mobile = 0,
    size_tablet = 1
}SASystemSize;

// callback for iOS's own [NSURLConnection sendAsynchronousRequest:]
typedef void (^netresponse)(NSURLResponse * response, NSData * data, NSError * error);

// callback for generic success with data
typedef void (^success)(NSData *data);

// callback for generic failure with no data
typedef void (^failure)();

@interface SAUtils : NSObject

////////////////////////////////////////////////////////////////////////////////
// Trully aux functions
////////////////////////////////////////////////////////////////////////////////

+ (CGRect) mapOldFrame:(CGRect)frame toNewFrame:(CGRect)oldframe;
+ (NSInteger) randomNumberBetween:(NSInteger)min maxNumber:(NSInteger)max;
+ (NSString*) findSubstringFrom:(NSString*)source betweenStart:(NSString*)start andEnd:(NSString*)end;

////////////////////////////////////////////////////////////////////////////////
// System type functions
////////////////////////////////////////////////////////////////////////////////

+ (SASystemSize) getSystemSize;
+ (NSString*) getVerboseSystemDetails;

////////////////////////////////////////////////////////////////////////////////
// URL and Network request helper classes
////////////////////////////////////////////////////////////////////////////////

+ (NSString*) getUserAgent;
+ (NSInteger) getCachebuster;
+ (NSString*) formGetQueryFromDict:(NSDictionary*)dict;
+ (NSString*) encodeURI:(NSString*)stringToEncode;
+ (NSString*) encodeJSONDictionaryFromNSDictionary:(NSDictionary*)dict;
+ (NSString*) decodeHTMLEntitiesFrom:(NSString*)string;
+ (BOOL) isValidURL:(NSObject*) urlObject;

////////////////////////////////////////////////////////////////////////////////
// Aux network functions
////////////////////////////////////////////////////////////////////////////////

+ (NSData*) sendSyncGETToEndpoint:(NSString*)endpoint;
+ (void) sendGETtoEndpoint:(NSString*)endpoint withQueryDict:(NSDictionary*)GETDict andSuccess:(success)success orFailure:(failure)failure;

@end
