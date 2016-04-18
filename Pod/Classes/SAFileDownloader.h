//
//  SAFileDownloader.h
//  Pods
//
//  Created by Gabriel Coman on 18/04/2016.
//
//

#import <Foundation/Foundation.h>

//
// import SAUtils
#import "SAUtils.h"

//
// callback for generic success with data
typedef void (^downloadSuccess)(NSString *fpath);

//
// class that deals with downloading (and cleaning-up) files
@interface SAFileDownloader : NSObject

//
// singleton instance (instead of init)
+ (SAFileDownloader*) getInstance;

/**
 *  Function that downloads a file and saves it to the documents directory
 *
 *  @param url     the remote URL of the file
 *  @param success a success callback with the file's path
 *  @param failure a failure callback in case file could not be donwloaded
 */
- (void) downloadFile:(NSString*)url withSuccess:(downloadSuccess)success orFailure:(failure)failure;

@end
